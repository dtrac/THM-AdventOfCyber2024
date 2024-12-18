# Notes for Day16

<img src="azure-xmas.png" alt="drawing" width="200"/>

## Theme **Azure (Assumed Breach)**

## Links
- [Exploiting Active Directory](https://tryhackme.com/r/room/exploitingad)
## General

```bash
az ad signed-in-user show
az ad signed-in-user show --query "{displayName: displayName, userPrincipalName: userPrincipalName}" --output json
# Entra ID Enumeration
az ad user list
az ad user list --filter "startsWith('wvusr-', displayName)"
az ad group list
az ad group member list --group "Secret Recovery Group"
# Switch user context whilst maintaining the session:
az account clear
az login -u EMAIL -p PASSWORD
# Check role assignments
az role assignment list --assignee <groupid> --all
# investigate KV
az keyvault list
az keyvault secret list --vault-name warevillesecrets
az keyvault secret show --vault-name warevillesecrets --name xxxx
```