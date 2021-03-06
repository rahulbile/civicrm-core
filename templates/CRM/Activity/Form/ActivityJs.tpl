{*
 +--------------------------------------------------------------------+
 | CiviCRM version 4.4                                                |
 +--------------------------------------------------------------------+
 | Copyright CiviCRM LLC (c) 2004-2013                                |
 +--------------------------------------------------------------------+
 | This file is a part of CiviCRM.                                    |
 |                                                                    |
 | CiviCRM is free software; you can copy, modify, and distribute it  |
 | under the terms of the GNU Affero General Public License           |
 | Version 3, 19 November 2007 and the CiviCRM Licensing Exception.   |
 |                                                                    |
 | CiviCRM is distributed in the hope that it will be useful, but     |
 | WITHOUT ANY WARRANTY; without even the implied warranty of         |
 | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.               |
 | See the GNU Affero General Public License for more details.        |
 |                                                                    |
 | You should have received a copy of the GNU Affero General Public   |
 | License and the CiviCRM Licensing Exception along                  |
 | with this program; if not, contact CiviCRM LLC                     |
 | at info[AT]civicrm[DOT]org. If you have questions about the        |
 | GNU Affero General Public License or the licensing of CiviCRM,     |
 | see the CiviCRM license FAQ at http://civicrm.org/licensing        |
 +--------------------------------------------------------------------+
*}
{* added onload javascript for source contact*}
{literal}
<script type="text/javascript">
  /**
   * Function to check activity status in relavent to activity date
   *
   * @param element message JSON object.
   */
  function activityStatus(message) {
    var date =  cj("#activity_date_time_display").datepicker('getDate');
    if (date) {
      var
        now = new Date(),
        time = cj("#activity_date_time_time").timeEntry('getTime') || date,
        activityStatusId = cj('#status_id').val(),
        d = date.toString().split(' '),
        activityDate = new Date(d[0] + ' ' + d[1] + ' ' + d[2] + ' ' + d[3] + ' ' + time.toTimeString());
      if (activityStatusId == 2 && now < activityDate) {
        return confirm(message.completed);
      }
      else if (activityStatusId == 1 && now >= activityDate) {
        return confirm(message.scheduled);
      }
    }
  }

</script>
{/literal}
