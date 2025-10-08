@echo off
echo Refreshing GitHub App token...
curl -s "https://us-central1-gitplumbers-35d92.cloudfunctions.net/getInstallationAccessToken/87349104" > token_response.json
for /f "delims=" %%%%i in ('powershell -Command "^(Get-Content token_response.json ^| ConvertFrom-Json^).token"') do set NEW_TOKEN=%%%%i
del token_response.json
git remote set-url origin https://x-access-token:%%NEW_TOKEN%%@github.com/SupportPlumbersTestUser/TestUserRepo.git
echo Token refreshed! You can now push your changes.
