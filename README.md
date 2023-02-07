# stable-diffusion-ui-startup
start stable diffusion ui as a win32 service

run as administrator via cmd.
the bat file downloads and installs:
7-zip
nssm

the bat file also enables
openssh service for windows; this allows a remote user on the network that has an account on the windows workstation to retrieve created images (should they be autosaved)

edit sample service to match stable-diffusion-ui cmd
