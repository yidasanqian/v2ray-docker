# v2ray-arukas-all-in-one

A v2ray docker image work with nginx for Arukas/IBM/okteto

- v2ray work with websocket
- v2ray request proxy_pass by nginx
- custom v2ray settings
- add environment variables to edit optional setting
  - CLIENT_ID (default c01e0c6c-b987-41b2-85ce-38e3c80a096e)
  - CLIENT_ALTERID (default 64)
  - CLIENT_WSPATH (default /ws)
  - VER (default 4.32.1)
- don't need custom domain and ssl certificate
- only cost 1 pods

**USE: deploy this image and add default secure route with port 8080 in arukas**

- path to v2ray: https://your.domain/fuckgfw_letscrossgfw
- path to websites: /usr/share/nginx/html/

实例教程参考 ： https://bawodu.com/openshift-v2ray/
