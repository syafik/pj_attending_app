// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function() {
//    $('.get_out').hide();
    
    $(document).ready(function() {
        // Create two variable with the names of the months and days in an array
        var monthNames = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]; 
        var dayNames= ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]

        // Create a newDate() object
        var newDate = new Date();
        // Extract the current date from Date object
        newDate.setDate(newDate.getDate());
        // Output the day, date, month and year   
        $('#Date').html(dayNames[newDate.getDay()] + " " + newDate.getDate() + ' ' + monthNames[newDate.getMonth()] + ' ' + newDate.getFullYear());

        setInterval( function() {
            // Create a newDate() object and extract the seconds of the current time on the visitor's
            var seconds = new Date().getSeconds();
            // Add a leading zero to seconds value
            $("#sec").html(( seconds < 10 ? "0" : "" ) + seconds);
        },1000);

        setInterval( function() {
            // Create a newDate() object and extract the minutes of the current time on the visitor's
            var minutes = new Date().getMinutes();
            // Add a leading zero to the minutes value
            $("#min").html(( minutes < 10 ? "0" : "" ) + minutes);
        },1000);

        setInterval( function() {
            // Create a newDate() object and extract the hours of the current time on the visitor's
            var hours = new Date().getHours();
            // Add a leading zero to the hours value
            $("#hours").html(( hours < 10 ? "0" : "" ) + hours);
        }, 1000);	
    });
    
});