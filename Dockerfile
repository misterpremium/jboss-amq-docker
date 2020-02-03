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

# Expose port 8181
EXPOSE 8181

# Expose port 61616
EXPOSE 61616

CMD ["/opt/amq/bin/launch.sh"]
