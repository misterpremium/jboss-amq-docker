# We are basing our builder image on openshift s2i-core-rhel7 image
FROM  registry.access.redhat.com/jboss-amq-6/amq63-openshift:1.4

# Software versions being used inside the builder
ENV jboss-eap=7.1

#Database drivers configurations & Custom folders for datasources & && change permissions
# Create custom folders a
RUN mkdir -p /opt/amq



#Custom assemble script
COPY ./etc/s2i/bin/assemble /usr/local/sbin/assemble
COPY ./etc/s2i/bin/common.sh /usr/local/sbin/common.sh
COPY ./etc/s2i/bin/install-common.sh /usr/local/sbin/install-common.sh
COPY ./etc/s2i/bin/run /usr/local/sbin/run
COPY ./etc/s2i/bin/save-artifacts /usr/local/sbin/save-artifacts
ADD --chown=jboss:root "./etc/conf/activemq.xml" "/opt/amq/conf/activemq.xml_"
ADD --chown=jboss:root "./etc/conf/activemq.xml" "/opt/amq/conf/activemq.xml"
# Expose port 8161
EXPOSE 8161

# Expose port 61616

EXPOSE 5672 5671 1883 8883 61613 61612 61616 61617
CMD ["/opt/amq/bin/launch.sh"]
