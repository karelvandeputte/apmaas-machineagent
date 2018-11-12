FROM registry.access.redhat.com/rhel
LABEL maintainer="Karel Vandeputte <karel.vandeputte@hcl.com>"

ADD appd.sh /opt/appdynamics/
ADD volvogroup-appdynamics-machine-agent-4.3.5.13-1.x86_64.rpm /opt/appdynamics/
ADD KubernetesSnapshotExtension-0.74.zip /opt/appdynamics/

RUN chmod a+x /opt/appdynamics/appd.sh

RUN yum localinstall -y /opt/appdynamics/volvogroup-appdynamics-machine-agent-4.3.5.13-1.x86_64.rpm
RUN yum localinstall -y /opt/appdynamics/volvogroup-appdynamics-java-agent-4.3.5.13-1.x86_64.rpm

VOLUME /opt/appdynamics/app-agent

CMD [ "/bin/sh", "-c", "/opt/appdynamics/appd.sh" ]
