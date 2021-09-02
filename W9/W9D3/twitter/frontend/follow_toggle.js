class FollowToggle {
    constructor(el) {
        this.userId = el.getAttribute("data-user-id");
        this.followState = el.getAttribute("data-initial-follow-state");
        this.el = el;
        this.render();
        this.handleClick();
    }

    render() {
        let text = "";
        if (this.el.getAttribute)
        if (this.followState === "followed") {
            text = "Unfollow!";
        } else {
            text = "Follow!";
        }
        this.el.append(text);
    }

    handleClick() {
        let that = this;
        this.el.addEventListener("click", function(event) {
            event.preventDefault();
            $.ajax({
                url: `/users/${that.userId}/follow`,
                method: 'post',
                success: function() {
                    if (that.followState === "followed") {
                        that.followState = "unfollowed";
                    } else {
                        that.followState = "followed";
                    };
                    that.render();
                },
                error: function () {
                    if (that.followState === "followed") {
                        that.followState = "unfollowed";
                    } else {
                        that.followState = "followed";
                    };
                    that.render();
                },
                dataType: 'JSON',
            })
        })
    }
}

module.exports = FollowToggle;