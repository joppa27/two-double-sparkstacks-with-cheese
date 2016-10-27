FROM java:8-jdk

ENV SPARK_HOME /opt/spark-1.6.2-bin-hadoop2.6
ENV PATH="${SPARK_HOME}/bin:${PATH}"
ADD spark-defaults.conf $SPARK_HOME/conf/
RUN wget -q http://d3kbcqa49mib13.cloudfront.net/spark-1.6.2-bin-hadoop2.6.tgz -O /opt/spark-1.6.2-bin-hadoop2.6.tgz \
&& tar -zxf /opt/spark-1.6.2-bin-hadoop2.6.tgz -C /opt/ \
&& rm -rf /opt/spark-1.6.2-bin-hadoop2.6.tgz \ \
&& mkdir -p /tmp/spark-events/

EXPOSE 8080 7077 8888 8081 4040 7001 7002 7003 7004 7005 7006
CMD ["spark-class", "org.apache.spark.deploy.master.Master"]
