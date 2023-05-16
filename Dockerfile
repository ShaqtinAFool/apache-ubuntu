FROM ubuntu:22.04
LABEL maintainer="tony"

RUN apt update
RUN apt install -y net-tools telnetd

# Enable SSH
RUN apt install -y --no-install-recommends dialog \
    && apt install -y --no-install-recommends openssh-server \
    && echo "root:Docker!" | chpasswd
    # && cd /etc/ssh/ \
    # && ssh-keygen -A
COPY sshd_config /etc/ssh/
EXPOSE 2222

# Install apache
RUN apt install -y apache2
EXPOSE 80

# Start apache
COPY entrypoint.sh /root
RUN chmod +x /root/entrypoint.sh
ENTRYPOINT ["/root/entrypoint.sh"]