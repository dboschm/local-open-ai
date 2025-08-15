# Set the base image to nginx
FROM nginx
# Copy our custom nginx.conf to the Docker image
COPY nginx.conf /etc/nginx/nginx.conf.template
ARG OPEN_AI_API_KEY
# set ENV from ARG so it exists in the final image
ENV OPEN_AI_API_KEY=${OPEN_AI_API_KEY}
RUN echo OPEN_AI_API_KEY
RUN envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
RUN rm /etc/nginx/nginx.conf.template

# Expose port 5555 for the application
EXPOSE 5555
