FROM quay.io/oauth2-proxy/oauth2-proxy

# Copy generated site from the gh-pages branch
COPY site /app/

# Copy email list configuration
COPY email_list.txt /site_config/

ENTRYPOINT ["/bin/oauth2-proxy", \
            "--provider", "github", \
            "--upstream", "file:///app/#/", \
            "--authenticated-emails-file", "/site_config/email_list.txt", \
            "--cookie-expire=0h0m30s", \
            "--skip-provider-button=true"]
