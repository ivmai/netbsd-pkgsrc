/* $NetBSD: pwauth_suid_helper.c,v 1.2 2008/07/17 18:00:58 drochner Exp $ */

#include <pwd.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>

static char pwbuf[_PASSWORD_LEN + 1];

int
main(int argc, char **argv)
{
	const struct passwd *pwent;
	ssize_t res;
	char *bufptr;
	const char *pwhash;
	size_t buflen;

	if (argc != 2)
		return (EINVAL);

	/*
	 * mlock(2) pwbuf[]? NetBSD's getpass(3) doesn't,
	 * so don't bother for now.
	 */

	bufptr = pwbuf;
	buflen = sizeof(pwbuf);
	do {
		res = read(STDIN_FILENO, bufptr, buflen);
		if (res < 0)
			return (errno);
		bufptr += res;
		buflen -= res;
	} while (res > 0 && buflen > 0);
	if (buflen == 0)
		return (ENOMEM);
	/* pwbuf is \0-terminated here b/c pwbuf is in bss */
	pwbuf[sizeof(pwbuf) - 1] = '\0'; /* be paranoid */

	/*
	 * Use username as key rather than uid so that it will not
	 * fail completely if multiple pw entries share a uid.
	 * Return same result in "not me" and "doesn't exist" cases
	 * to avoid leak of account information.
	 */
	pwent = getpwnam(argv[1]);
	if (!pwent || (pwent->pw_uid != getuid()))
		return (EPERM);

	/*
	 * Forcibly eat up some wall time to prevent use of this program
	 * to brute-force.
	 */
	usleep(100000);

	pwhash = crypt(pwbuf, pwent->pw_passwd);
	memset(pwbuf, 0, sizeof(pwbuf));
	if (pwhash && strcmp(pwhash, pwent->pw_passwd) == 0)
		return (0);

	return (EAUTH);
}
