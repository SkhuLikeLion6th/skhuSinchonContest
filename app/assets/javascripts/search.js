// jQuery(function() {
//   var albums;
//   albums = $('#album_id').html();
//   console.log(albums);
//   return $('#singer_id').change(function() {
//     var singer, options;
//     singer = $('#singer_id :selected').text();
//     options = $(albums).filter("optgroup[label=" + singer + "]").html();
//     console.log(options);
//     if (options) {
//       return $('#album_id').html(options);
//     } else {
//       return $('#album_id').empty();
//     }
//   });
// });

/*Global jQuery*/
jQuery(function() {
  var albums;
  $('#album_id').parent().hide();
  albums = $('#album_id').html();
  console.log(albums);
  return $('#singer_id').change(function() {
    var singer, escaped_singer, options;
    singer = $('#singer_id :selected').text();
    escaped_singer = singer.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(albums).filter("optgroup[label=" + escaped_singer + "]").html();
    console.log(options);
    if (options) {
      $('#album_id').html(options);
      return $('#album_id').parent().show();
    } else {
      $('#album_id').empty();
      return $('#album_id').parent().hide();
    }
  });
});
