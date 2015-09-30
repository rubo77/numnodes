#numnodes

# Website integration

This can be used in your website with the following codeblock:

    <style type="text/css">
      .numnodes{
        position:absolute;margin-left:-120px; margin-top:24px;
        width: 118px;
        height: 92px;
      }
      @media only screen and (max-width: 870px) {
        .numnodes{
          display: none;
        }
      } 
    </style>
    <iframe class="numnodes" src="/numnodes.html" border="0" frameborder="0" allowtransparency="true" scrolling="no"></iframe>

# Cronjob
call `numnodes.sh` every minute in `/etc/cron.d/numnodes` with

    PATH=/usr/sbin:/usr/bin:/sbin:/bin

    * * * * *	root	/bin/bash /opt/ffki-startseite/numnodes.sh >/dev/null 2>&1

