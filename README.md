# Terraform sample

Create a terraform module that will:

* Take as input a list of image IDs and a folder name
* Fetch the image metadata from https://picsum.photos/ and create an index.html in the specified folder that looks like:

    ```text
    These are your images, sorted by ID number
    <image 1 inline>
    <image 2 inline>
    ...
    <image n inline>
    ```

* Return as output a map of objects that looks like:

    ```terraform
    image_id = {
        author       = string
        download_url = string
        width        = number
        height       = number
    }
    ```

## Tying it all together

After running `terraform apply` the folder `downloads` should contain the images and a text file containing an index.html file that includes all the images.

You may also run the included validation tool to further test your work. You can run the tool like so:

```shell
# Run tests
./validate.sh
```

## Bonus points

The assumed terraform provider that would be used to fetch the image metadata doesn't work when downloading binary data. How could you work around this?
