FROM alpine:latest

RUN apk add bash
COPY --chmod=700 --chown=root:root ./awg.conf /etc/wireguard/awg.conf
COPY --chmod=755 --chown=root:root ./init.sh /bin/init.sh
COPY --from=amneziavpn/amnezia-wg:latest --chmod=755 /usr/bin/wireguard-go /usr/bin/wireguard-go
COPY --from=amneziavpn/amnezia-wg:latest --chmod=755 /usr/bin/wg-quick /usr/bin/wg-quick
COPY --from=amneziavpn/amnezia-wg:latest --chmod=755 /usr/bin/wg /usr/bin/wg

CMD "/bin/init.sh"
