require 'cgi'
cgi = CGI.new

cgi.out("type" => "text/html", "charset" => "UTF-8") {
  get = cgi['bad_quality']

  "<html>
    <body>
      <p>品質が悪いもの（false）のgoyaの情報は下記になります</p>
      <p>#{get}</p>
    </body>
  </html>"
}
