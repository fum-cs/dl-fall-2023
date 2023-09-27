---
layout: page
title: Home / Lectures
nav_order: 1
description: A description of the content covered in the course.
currWeekNumber: 1
---

# Deep Learning

{: .mb-2 }
Ferdowsi University of Mashhad, Fall 2023
{: .mb-0 .fs-6 .text-grey-dk-000 }


<div>
{% assign instructors = site.staffers | where: 'role', 'Instructor' %}
  <div class="role">
    {% for staffer in instructors %}
    {{ staffer }}
    {% endfor %}
  </div>
</div>

{: .highlight }
> Welcome to Deep Learning Course!


<a name="schedule"></a>
## Schedule

{% for module in site.modules %}
{{ module }}
{% endfor %}

