/* Author:

 */


function deleteComment(id) {
  var width = 450;
  var height = 400;
  try {
    openWindow.close();
  } catch (e) {
  }
  openWindow = window.open("/reviews/deledit/" + id, "alt_sogang", "width=" + width + ",height=" + height + ",location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
  openWindow.focus();
  alignCenter(openWindow, width, height);

}
function alignCenter(win, width, height) {
  if (navigator.userAgent.indexOf("Chrome") == -1)
    win.moveTo(screen.width / 2 - width / 2, screen.height / 2 - height / 2);
}


jQuery(document).ready(function () {
  $("time.timeago").timeago();

  $(".flash-notification").alert();
});