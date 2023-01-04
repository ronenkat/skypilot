FROM redhat/ubi9-init

ARG SKY_RAY_PUBLIC_KEY

RUN yum -y install openssh-server ed openssh-clients glibc-langpack-en && yum clean all && systemctl enable sshd;
#RUN sed -i 's/#Port.*$/Port 2022/' /etc/ssh/sshd_config;
RUN chmod 775 /var/run && rm -f /var/run/nologin
RUN mkdir /etc/systemd/system/sshd.service.d/ && echo -e '[Service]\nRestart=always' > /etc/systemd/system/sshd.service.d/sshd.conf


RUN adduser --system -s /bin/bash -u 1001 sky-ray
RUN mkdir -p /home/sky-ray/.ssh

RUN touch /home/sky-ray/.ssh/authorized_keys
RUN chmod 700 /home/sky-ray/.ssh
RUN chmod 600 /home/sky-ray/.ssh/authorized_keys
RUN sed -i 's/1001/0/g' /etc/passwd
RUN echo ${SKY_RAY_PUBLIC_KEY} >> /home/sky-ray/.ssh/authorized_keys
RUN chown -R sky-ray:sky-ray /home/sky-ray/
EXPOSE 22

# screen is deprecated on ubi platform, so need to install from epel
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm 
RUN yum -y install python3-pip git;
RUN yum -y install sudo patch rsync pciutils
RUN yum -y install screen
# .bashrc must exists for ssh
RUN touch /home/sky-ray/.bashrc

CMD ["/sbin/init"]
