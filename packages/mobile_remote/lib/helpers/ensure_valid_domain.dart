
String ensureValidDomain(String domain){
  if (domain.startsWith("https://") || domain.startsWith("http://")) {
    return domain;
  }
  return "http://${domain}";
}