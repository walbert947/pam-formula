{% from "pam/map.jinja" import pam_settings with context %}
{% set os = grains['os_family'] %}
{% set release = grains['osmajorrelease'] %}

{% for file in pam_settings['files'] %}
pam_{{ file }}:
  file.managed:
    - name: /etc/pam.d/{{ file }}
    - template: jinja
    - source: salt://pam/templates/{{ os }}-{{ release }}/{{ file }}
    - user: root
    - group: root
    - mode: '0444'
{% endfor %}
