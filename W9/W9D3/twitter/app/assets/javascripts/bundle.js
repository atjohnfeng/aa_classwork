/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module) => {

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

/***/ }),

/***/ "./frontend/users_search.js":
/*!**********************************!*\
  !*** ./frontend/users_search.js ***!
  \**********************************/
/***/ ((module) => {

class UsersSearch {
    constructor(el) {
        this.el = el;
        
    }
}

module.exports = UsersSearch;

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");
const UsersSearch = __webpack_require__(/*! ./users_search */ "./frontend/users_search.js");

document.addEventListener("DOMContentLoaded", function() {
    $(".follow-toggle").each(function(i, el){
        const toggle = new FollowToggle(el);
        // console.log("Hey");
    })

    $(".users-search").each(function (i, el){
        const userSearch = new UsersSearch(el);
    })
});
})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map