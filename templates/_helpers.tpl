{{/*
Expand the name of the chart.
*/}}
{{- define "final-assignment.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Should the name of the service account be used
*/}}
{{- define "final-assignment.serviceAccountNameAssign" }}
{{- if .Values.serviceAccount.create }}
serviceAccountName: {{ .Release.Name }}-helm-module
{{- end }}
{{- end }}

{{/*
  Declare common resource name identifier:  
*/}}
{{- define "final-assignment.resourceName" }}
name: {{ .Release.Name }}-helm-module
{{- end }}