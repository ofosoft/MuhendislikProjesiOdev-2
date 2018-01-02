function AutoComplete(targetId, count, timeout, service, method) {

    var timeoutId;
    var request;
    var target = document.getElementById(targetId);
    var list = CreateList(target);

    $addHandler(target, "keyup", function() {
        if (timeoutId != undefined) {
            clearTimeout(timeoutId);
        }
        if (request != undefined) {
            var executor = request.get_executor();
            if (executor.get_started()) {
                executor.abort();
            }
        }
        timeoutId = setTimeout(function() {
            request = service._staticInstance[method](target.value, count, success, function() { });
        }, timeout);
    });

    $addHandler(document, "click", function(e) {
        if ((e.srcElement == target) || (e.target == target)) {
            return false;
        }
        list.style.display = "none";
        if (list.value != '') {
            target.value = list.value;
        }
    });

    function success(result) {
        list.options.length = 0;
        if (result != '') {
            list.setAttribute("size", result.length + 1);
            list.style.display = "block";
            for (var index = 0; index < result.length; index++) {
                list.options.add(new Option(result[index], result[index], false));
            }
        } else {
            list.style.display = "none";
        }
    }
}

function CreateList(sender) {
    var div = document.createElement("div");
    var list = document.createElement("select");
    list.style.position = "absolute";
    list.style.display = "none";
    div.appendChild(list);
    sender.parentNode.insertBefore(div, sender.nextSibling);
    return list;
}