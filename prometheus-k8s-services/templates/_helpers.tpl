{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "prometheus-k8s-services.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "prometheus-k8s-services.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "prometheus-k8s-services.labels.selector" -}}
app: {{ template "prometheus-k8s-services.name" . }}
group: {{ .Values.prometheusK8sServices.labels.group }}
provider: {{ .Values.prometheusK8sServices.labels.provider }}
{{- end -}}

{{- define "prometheus-k8s-services.labels.stakater" -}}
{{ template "prometheus-k8s-services.labels.selector" . }}
version: "{{ .Values.prometheusK8sServices.labels.version }}"
{{- end -}}

{{- define "prometheus-k8s-services.labels.chart" -}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}
