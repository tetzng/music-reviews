$(document).on('turbolinks:load', function(){
  $('#nav-toggle').on('click', function() {
    $('body').toggleClass('open');
  });
  const searchType =$('#search-type');
  const artistForm = $('#artist-search-wrap');
  const albumForm = $('#album-search-wrap');
  const trackForm = $('#track-search-wrap');

  if(document.URL.match(/albums/)) {
    $(document).ready(function(){
      albumForm.show();
      searchType.val('album_name');
    });
  }
  else if(document.URL.match(/tracks/)) {
    $(document).ready(function(){
      trackForm.show();
      searchType.val('track_name');
    });
  }
  else {
    $(document).ready(function(){
      artistForm.show();
      searchType.val('artist_name');
    });
  }

  searchType.on('change', function(){
    const selectedType = $(this).val();

    artistForm.hide();
    albumForm.hide();
    trackForm.hide();
    switch (selectedType) {
      case 'artist_name':
        artistForm.show();
        break;
      case 'album_name':
        albumForm.show();
        break;
      case 'track_name':
        trackForm.show();
        break;
      default:
        artistForm.show();
        break;
    }
  });
});