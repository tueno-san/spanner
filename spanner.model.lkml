connection: "spanner"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

explore: stlm_spfc_amt2 {
  sql_always_where:
    {% if _user_attributes['can_access_data'] == 'NG' %}
      1=2
    {% else %}
      1=1
    {% endif %};;
}
