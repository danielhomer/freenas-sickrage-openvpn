FROM linuxserver/sickrage:latest
LABEL org.freenas.interactive="false" \
      org.freenas.version="1" \
      org.freenas.upgradeable="true" \
      org.freenas.expose-ports-at-host="true" \
      org.freenas.autostart="true" \
      org.freenas.web-ui-protocol="http" \
      org.freenas.web-ui-port="8081" \
      org.freenas.web-ui-path="" \
      org.freenas.port-mappings="8081:8081/tcp" \
      org.freenas.volumes="[                        \
          {                             \
              \"name\": \"/config\",                    \
              \"descr\": \"Sickrage config files\"          \
          },                                \
          {                             \
              \"name\": \"/downloads\",                 \
              \"descr\": \"Sickrage downloads volume\"          \
          },                                \
          {                             \
              \"name\": \"/tv\",                    \
              \"descr\": \"Location of TV library\"         \
          }                             \
      ]"  \
      org.freenas.settings="[                       \
          {                             \
              \"env\": \"TZ\",                      \
              \"descr\": \"Timezone information, eg Europe/London\",    \
              \"optional\": true                    \
          }, \
          { \
              \"env\": \"OPENVPN_USERNAME\" \
              \"descr\": \"OpenVPN Username\", \
              \"optional\": false \
          }, \
          { \
              \"env\": \"OPENVPN_PASSWORD\" \
              \"descr\": \"OpenVPN Password\", \
              \"optional\": false \
          }, \
          { \
              \"env\": \"OPENVPN_PROVIDER\" \
              \"descr\": \"OpenVPN Provider\", \
              \"optional\": false \
          } \
      ]"


RUN apk add --no-cache openvpn

ADD openvpn/ /etc/openvpn/

CMD ["/etc/openvpn/start.sh"]
