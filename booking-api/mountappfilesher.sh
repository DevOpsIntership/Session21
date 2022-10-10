az webapp config storage-account add -g 'automation' -n 'adkwoleknginx' \
  --custom-id 'customid' \
  --storage-type 'AzureFiles' \
  --account-name 'adkwoleknginx' \
  --share-name 'nginx' \
  --access-key "PV5hRtAmEPYI54hALIt2UWanm+Lw0dJenuew+wNtfXVHMYByQQytM/9ALP2B76ySjnBwQ4+rlM2X+ASt3IwFBw==" \
  --mount-path '/usr/share/nginx/html'
  