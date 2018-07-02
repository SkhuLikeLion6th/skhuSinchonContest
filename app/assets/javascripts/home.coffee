# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
    albums = $('#search_album').html()
    members1 = $('#search_had_card').html()
    members2 = $('#search_want_card').html()
    areas = $('#search_area').html()
    console.log(members1)
    console.log(members2)
    console.log(areas)
    

    $('#search_singer').change ->
        singer = $('#search_singer :selected').text()
        
        options1 = $(albums).filter("optgroup[label='#{singer}']").html()
        if options1
            $('#search_album').html(options1)
        else
            $('#search_album').empty()
            
        options2 = $(members1).filter("optgroup[label='#{singer}']").html()
        if options2
            $('#search_had_card').html(options2)
        else
            $('#search_had_card').empty()
            
        options3 = $(members2).filter("optgroup[label='#{singer}']").html()
        if options3
            $('#search_want_card').html(options3)
        else
            $('#search_want_card').empty()
            
     $('#search_change_type').change ->
        change_type = $('#search_change_type :selected').text()
        
        options4 = $(areas).filter("optgroup[label='#{change_type}']").html()
        if options4
            $('#search_area').html(options4)
        else
            $('#search_area').empty()
            
            
            
            
    albums1 = $('#post_album').html()
    members3 = $('#post_had_card').html()
    members4 = $('#post_want_card').html()
    areas1 = $('#post_area').html()
    console.log(members3)
    console.log(members4)
    console.log(areas1)
    

    $('#post_singer').change ->
        singer1 = $('#post_singer :selected').text()
        
        options5 = $(albums1).filter("optgroup[label='#{singer1}']").html()
        if options5
            $('#post_album').html(options5)
        else
            $('#post_album').empty()
            
        options6 = $(members3).filter("optgroup[label='#{singer1}']").html()
        if options6
            $('#post_had_card').html(options6)
        else
            $('#post_had_card').empty()
            
        options7 = $(members4).filter("optgroup[label='#{singer1}']").html()
        if options7
            $('#post_want_card').html(options7)
        else
            $('#post_want_card').empty()
            
     $('#post_change_type').change ->
        change_type1 = $('#post_change_type :selected').text()
        
        options8 = $(areas1).filter("optgroup[label='#{change_type1}']").html()
        if options8
            $('#post_area').html(options8)
        else
            $('#post_area').empty()