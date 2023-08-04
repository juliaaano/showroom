{{- define "showroom.route" }}
{{- $service := index . 0 -}}
{{- $values := index . 1 -}}
{{- printf "http://%s-%s.%s" $service $values.namespace $values.deployer.domain }}
{{- end }}
