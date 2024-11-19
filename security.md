# Security

## Email contact

Make it easy for others to let you know about security issues.
Please add a security email contact to the HTML footer or the about page of every app.
Either use `security@<project-domain>` or `security@renuo.ch`.
Incoming issues will be treated with high priority by _wg-operations_.

There is also a `.well-known/security.txt` file you can provide:

```txt
Contact: mailto:security@renuo.ch
Expires: 2050-11-11T13:37:42.000Z
Preferred-Languages: de, en
```

## Cipher suite review

Review your SSL/TLS configuration periodically: <https://www.ssllabs.com/ssltest/>
