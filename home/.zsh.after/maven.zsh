maven_dep_version() {
  local repo=$(xpath -q -e "//settings/mirrors/mirror/url/text()" ~/.m2/settings.xml)
  curl $repo/$1/maven-metadata.xml | xpath -q -e "//metadata/versioning/latest/text()" || echo "$1 Not found!"
}

maven_snapshot_version() {
  local repo=$(xpath -q -e "//settings/mirrors/mirror/url/text()" ~/.m2/settings.xml | sed 's/repo/libs-snapshot/')
  curl $repo/$1/maven-metadata.xml | xpath -q -e "//metadata/versioning/latest/text()" || echo "$1 Not found!"
}
