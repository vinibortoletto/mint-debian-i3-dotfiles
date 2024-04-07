<details>
  <summary>Add Natural Scrolling</summary>

    ## Edit 40-libinput.conf and add Option "NaturalScrolling" "True" to the Identifiers bellow:

    ```bash 
    sudo nano /usr/share/X11/xorg.conf.d/40-libinput.conf
    ```

    ```bash 
    libinput pointer catchall
    ```

    ```bash 
    libinput touchpad catchall
    ```

  </details>
</details>