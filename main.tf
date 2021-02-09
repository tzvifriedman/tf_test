

data "http" "test" {
  count = length(var.image_list)
  url = "https://picsum.photos/id/${local.sorted_map[count.index]}/info"
  
  request_headers = {
    Accept = "application/json"
  }
}

output "image_id" {
  value = [for d in data.http.test.*.body: jsondecode(d)]
}


locals{
  sorted_map = sort(var.image_list)
  url_map = [for out in data.http.test.*.body : jsondecode(out)["download_url"]]
}

resource "local_file" "index" {
  content = templatefile("index.tpl", {urls = local.url_map})
  filename = "downloads/index.html"
}