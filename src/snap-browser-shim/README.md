# Snap browser shim

Very annoyingly, Canonical have moved to using Snaps to deploy their browsers.  This of course causes all sorts of problems because Snaps are by default not allowed to open `.` files in a user's home directory, and a number of applications use temporary files to communicate secrets to browsers. Examples of applications this affects include Dropbox and Jupyter.

The script `snap-browser-shim.sh` is meant to copy that temporary file to a location that is available to Snaps, and then invoke a browser (by default `firefox`) to open it.

## Instructions

1. Copy  `snap-browser-shim.sh` to a directory in your `$PATH`.
2. If desired, modify it to put temporary files in a different location and start a different browser.

**Note** - you cannot store the temporary files in `/tmp/` or `/dev/shm` or other locations which will be automatically cleaned because Snaps are not allowed to access those locations. You will therefore infinitely slowly fill up this location with temporary files. You probably want to empty that directory regularly (maybe as an automated task).  The shim does not delete this file after the browser process closes because depending on whether the browser is already running or not, this process has different behaviour and we cannot guarantee that it terminating means the file has been opened. Welcome to everything being intentionally painful.  This is what Snaps bring you.

You can control both the temporary directory path and the browser at run time with the `$SHIM_TMP_DIR` and `$SHIM_BROWSER` environment variables.

## Jupyter

To use the shim with Jupyter you should first test that it works at all by doing:

```
jupyter lab --browser "snap-browser-shim.sh %s"
```

If this launches correctly, exit the browser, shut down Jupyter and then run:

```
jupyter server --generate-config
```

This will generate the file `~/.jupyter/jupyter_server_config.py` which contains settings for all your Jupyter servers. 

Open it in your editor and scroll down to:

```python
## Specify what command to use to invoke a web
#                        browser when starting the server. If not specified, the
#                        default browser will be determined by the `webbrowser`
#                        standard library module, which allows setting of the
#                        BROWSER environment variable to override it.
#  Default: ''

# c.ServerApp.browser = ''
```

Uncomment the last line and change it to:
```python
## Specify what command to use to invoke a web
#                        browser when starting the server. If not specified, the
#                        default browser will be determined by the `webbrowser`
#                        standard library module, which allows setting of the
#                        BROWSER environment variable to override it.
#  Default: ''

c.ServerApp.browser = 'snap-browser-shim.sh %s' 
```

Now when you run `jupyter lab` it should start your browser correctly.
