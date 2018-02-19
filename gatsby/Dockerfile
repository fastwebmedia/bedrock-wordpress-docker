FROM mhart/alpine-node:9.5.0

EXPOSE 8000

RUN yarn global add gatsby-cli

COPY init.sh /bin/
RUN chmod +x /bin/init.sh
CMD [ "/bin/init.sh" ]
