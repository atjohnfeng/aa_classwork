const FollowToggle = require("./follow_toggle");
const UsersSearch = require("./users_search");

document.addEventListener("DOMContentLoaded", function() {
    $(".follow-toggle").each(function(i, el){
        const toggle = new FollowToggle(el);
        // console.log("Hey");
    })

    $(".users-search").each(function (i, el){
        const userSearch = new UsersSearch(el);
    })
});