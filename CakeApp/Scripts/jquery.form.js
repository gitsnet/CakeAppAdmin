﻿! function (e) {
    "use strict";

    function t(t) {
        var a = t.data;
        t.isDefaultPrevented() || (t.preventDefault(), e(this).ajaxSubmit(a))
    }

    function a(t) {
        var a = t.target,
            r = e(a);
        if (!r.is("[type=submit],[type=image]")) {
            var n = r.closest("[type=submit]");
            if (0 === n.length) return;
            a = n[0]
        }
        var i = this;
        if (i.clk = a, "image" == a.type)
            if (void 0 !== t.offsetX) i.clk_x = t.offsetX, i.clk_y = t.offsetY;
            else if ("function" == typeof e.fn.offset) {
                var o = r.offset();
                i.clk_x = t.pageX - o.left, i.clk_y = t.pageY - o.top
            } else i.clk_x = t.pageX - a.offsetLeft, i.clk_y = t.pageY - a.offsetTop;
        setTimeout(function () {
            i.clk = i.clk_x = i.clk_y = null
        }, 100)
    }

    function r() {
        if (e.fn.ajaxSubmit.debug) {
            var t = "[jquery.form] " + Array.prototype.join.call(arguments, "");
            window.console && window.console.log ? window.console.log(t) : window.opera && window.opera.postError && window.opera.postError(t)
        }
    }
    var n = {};
    n.fileapi = void 0 !== e("<input type='file'/>").get(0).files, n.formdata = void 0 !== window.FormData, e.fn.ajaxSubmit = function (t) {
        function a(t) {
            var a, r, n = e.param(t).split("&"),
                i = n.length,
                o = [];
            for (a = 0; i > a; a++) n[a] = n[a].replace(/\+/g, " "), r = n[a].split("="), o.push([decodeURIComponent(r[0]), decodeURIComponent(r[1])]);
            return o
        }

        function i(r) {
            for (var n = new FormData, i = 0; i < r.length; i++) n.append(r[i].name, r[i].value);
            if (t.extraData) {
                var o = a(t.extraData);
                for (i = 0; i < o.length; i++) o[i] && n.append(o[i][0], o[i][1])
            }
            t.data = null;
            var u = e.extend(!0, {}, e.ajaxSettings, t, {
                contentType: !1,
                processData: !1,
                cache: !1,
                type: s || "POST"
            });
            t.uploadProgress && (u.xhr = function () {
                var e = jQuery.ajaxSettings.xhr();
                return e.upload && e.upload.addEventListener("progress", function (e) {
                    var a = 0,
                        r = e.loaded || e.position,
                        n = e.total;
                    e.lengthComputable && (a = Math.ceil(r / n * 100)), t.uploadProgress(e, r, n, a)
                }, !1), e
            }), u.data = null;
            var l = u.beforeSend;
            return u.beforeSend = function (e, t) {
                t.data = n, l && l.call(this, e, t)
            }, e.ajax(u)
        }

        function o(a) {
            function n(e) {
                var t = e.contentWindow ? e.contentWindow.document : e.contentDocument ? e.contentDocument : e.document;
                return t
            }

            function i() {
                function t() {
                    try {
                        var e = n(v).readyState;
                        r("state = " + e), e && "uninitialized" == e.toLowerCase() && setTimeout(t, 50)
                    } catch (a) {
                        r("Server abort: ", a, " (", a.name, ")"), o(D), T && clearTimeout(T), T = void 0
                    }
                }
                var a = c.attr("target"),
                    i = c.attr("action");
                j.setAttribute("target", d), s || j.setAttribute("method", "POST"), i != f.url && j.setAttribute("action", f.url), f.skipEncodingOverride || s && !/post/i.test(s) || c.attr({
                    encoding: "multipart/form-data",
                    enctype: "multipart/form-data"
                }), f.timeout && (T = setTimeout(function () {
                    y = !0, o(k)
                }, f.timeout));
                var u = [];
                try {
                    if (f.extraData)
                        for (var l in f.extraData) f.extraData.hasOwnProperty(l) && u.push(e.isPlainObject(f.extraData[l]) && f.extraData[l].hasOwnProperty("name") && f.extraData[l].hasOwnProperty("value") ? e('<input type="hidden" name="' + f.extraData[l].name + '">').val(f.extraData[l].value).appendTo(j)[0] : e('<input type="hidden" name="' + l + '">').val(f.extraData[l]).appendTo(j)[0]);
                    f.iframeTarget || (h.appendTo("body"), v.attachEvent ? v.attachEvent("onload", o) : v.addEventListener("load", o, !1)), setTimeout(t, 15);
                    try {
                        j.submit()
                    } catch (m) {
                        var p = document.createElement("form").submit;
                        p.apply(j)
                    }
                } finally {
                    j.setAttribute("action", i), a ? j.setAttribute("target", a) : c.removeAttr("target"), e(u).remove()
                }
            }

            function o(t) {
                if (!g.aborted && !F) {
                    try {
                        M = n(v)
                    } catch (a) {
                        r("cannot access response document: ", a), t = D
                    }
                    if (t === k && g) return g.abort("timeout"), void S.reject(g, "timeout");
                    if (t == D && g) return g.abort("server abort"), void S.reject(g, "error", "server abort");
                    if (M && M.location.href != f.iframeSrc || y) {
                        v.detachEvent ? v.detachEvent("onload", o) : v.removeEventListener("load", o, !1);
                        var i, s = "success";
                        try {
                            if (y) throw "timeout";
                            var u = "xml" == f.dataType || M.XMLDocument || e.isXMLDoc(M);
                            if (r("isXml=" + u), !u && window.opera && (null === M.body || !M.body.innerHTML) && --O) return r("requeing onLoad callback, DOM not available"), void setTimeout(o, 250);
                            var l = M.body ? M.body : M.documentElement;
                            g.responseText = l ? l.innerHTML : null, g.responseXML = M.XMLDocument ? M.XMLDocument : M, u && (f.dataType = "xml"), g.getResponseHeader = function (e) {
                                var t = {
                                    "content-type": f.dataType
                                };
                                return t[e]
                            }, l && (g.status = Number(l.getAttribute("status")) || g.status, g.statusText = l.getAttribute("statusText") || g.statusText);
                            var c = (f.dataType || "").toLowerCase(),
                                d = /(json|script|text)/.test(c);
                            if (d || f.textarea) {
                                var p = M.getElementsByTagName("textarea")[0];
                                if (p) g.responseText = p.value, g.status = Number(p.getAttribute("status")) || g.status, g.statusText = p.getAttribute("statusText") || g.statusText;
                                else if (d) {
                                    var x = M.getElementsByTagName("pre")[0],
                                        b = M.getElementsByTagName("body")[0];
                                    x ? g.responseText = x.textContent ? x.textContent : x.innerText : b && (g.responseText = b.textContent ? b.textContent : b.innerText)
                                }
                            } else "xml" == c && !g.responseXML && g.responseText && (g.responseXML = X(g.responseText));
                            try {
                                L = _(g, c, f)
                            } catch (j) {
                                s = "parsererror", g.error = i = j || s
                            }
                        } catch (j) {
                            r("error caught: ", j), s = "error", g.error = i = j || s
                        }
                        g.aborted && (r("upload aborted"), s = null), g.status && (s = g.status >= 200 && g.status < 300 || 304 === g.status ? "success" : "error"), "success" === s ? (f.success && f.success.call(f.context, L, "success", g), S.resolve(g.responseText, "success", g), m && e.event.trigger("ajaxSuccess", [g, f])) : s && (void 0 === i && (i = g.statusText), f.error && f.error.call(f.context, g, s, i), S.reject(g, "error", i), m && e.event.trigger("ajaxError", [g, f, i])), m && e.event.trigger("ajaxComplete", [g, f]), m && !--e.active && e.event.trigger("ajaxStop"), f.complete && f.complete.call(f.context, g, s), F = !0, f.timeout && clearTimeout(T), setTimeout(function () {
                            f.iframeTarget || h.remove(), g.responseXML = null
                        }, 100)
                    }
                }
            }
            var u, l, f, m, d, h, v, g, x, b, y, T, j = c[0],
                w = !!e.fn.prop,
                S = e.Deferred();
            if (a)
                for (l = 0; l < p.length; l++) u = e(p[l]), w ? u.prop("disabled", !1) : u.removeAttr("disabled");
            if (f = e.extend(!0, {}, e.ajaxSettings, t), f.context = f.context || f, d = "jqFormIO" + (new Date).getTime(), f.iframeTarget ? (h = e(f.iframeTarget), b = h.attr("name"), b ? d = b : h.attr("name", d)) : (h = e('<iframe name="' + d + '" src="' + f.iframeSrc + '" />'), h.css({
                position: "absolute",
                top: "-1000px",
                left: "-1000px"
            })), v = h[0], g = {
                aborted: 0,
                responseText: null,
                responseXML: null,
                status: 0,
                statusText: "n/a",
                getAllResponseHeaders: function () { },
                getResponseHeader: function () { },
                setRequestHeader: function () { },
                abort: function (t) {
                        var a = "timeout" === t ? "timeout" : "aborted";
                        r("aborting upload... " + a), this.aborted = 1;
                        try {
                            v.contentWindow.document.execCommand && v.contentWindow.document.execCommand("Stop")
            } catch (n) { }
                        h.attr("src", f.iframeSrc), g.error = a, f.error && f.error.call(f.context, g, a, t), m && e.event.trigger("ajaxError", [g, f, a]), f.complete && f.complete.call(f.context, g, a)
            }
            }, m = f.global, m && 0 === e.active++ && e.event.trigger("ajaxStart"), m && e.event.trigger("ajaxSend", [g, f]), f.beforeSend && f.beforeSend.call(f.context, g, f) === !1) return f.global && e.active--, S.reject(), S;
            if (g.aborted) return S.reject(), S;
            x = j.clk, x && (b = x.name, b && !x.disabled && (f.extraData = f.extraData || {}, f.extraData[b] = x.value, "image" == x.type && (f.extraData[b + ".x"] = j.clk_x, f.extraData[b + ".y"] = j.clk_y)));
            var k = 1,
                D = 2,
                A = e("meta[name=csrf-token]").attr("content"),
                E = e("meta[name=csrf-param]").attr("content");
            E && A && (f.extraData = f.extraData || {}, f.extraData[E] = A), f.forceSync ? i() : setTimeout(i, 10);
            var L, M, F, O = 50,
                X = e.parseXML || function (e, t) {
                    return window.ActiveXObject ? (t = new ActiveXObject("Microsoft.XMLDOM"), t.async = "false", t.loadXML(e)) : t = (new DOMParser).parseFromString(e, "text/xml"), t && t.documentElement && "parsererror" != t.documentElement.nodeName ? t : null
                },
                C = e.parseJSON || function (e) {
                    return window.eval("(" + e + ")")
                },
                _ = function (t, a, r) {
                    var n = t.getResponseHeader("content-type") || "",
                        i = "xml" === a || !a && n.indexOf("xml") >= 0,
                        o = i ? t.responseXML : t.responseText;
                    return i && "parsererror" === o.documentElement.nodeName && e.error && e.error("parsererror"), r && r.dataFilter && (o = r.dataFilter(o, a)), "string" == typeof o && ("json" === a || !a && n.indexOf("json") >= 0 ? o = C(o) : ("script" === a || !a && n.indexOf("javascript") >= 0) && e.globalEval(o)), o
                };
            return S
        }
        if (!this.length) return r("ajaxSubmit: skipping submit process - no element selected"), this;
        var s, u, l, c = this;
        "function" == typeof t && (t = {
            success: t
        }), s = this.attr("method"), u = this.attr("action"), l = "string" == typeof u ? e.trim(u) : "", l = l || window.location.href || "", l && (l = (l.match(/^([^#]+)/) || [])[1]), t = e.extend(!0, {
            url: l,
            success: e.ajaxSettings.success,
            type: s || "GET",
            iframeSrc: /^https/i.test(window.location.href || "") ? "javascript:false" : "about:blank"
        }, t);
        var f = {};
        if (this.trigger("form-pre-serialize", [this, t, f]), f.veto) return r("ajaxSubmit: submit vetoed via form-pre-serialize trigger"), this;
        if (t.beforeSerialize && t.beforeSerialize(this, t) === !1) return r("ajaxSubmit: submit aborted via beforeSerialize callback"), this;
        var m = t.traditional;
        void 0 === m && (m = e.ajaxSettings.traditional);
        var d, p = [],
            h = this.formToArray(t.semantic, p);
        if (t.data && (t.extraData = t.data, d = e.param(t.data, m)), t.beforeSubmit && t.beforeSubmit(h, this, t) === !1) return r("ajaxSubmit: submit aborted via beforeSubmit callback"), this;
        if (this.trigger("form-submit-validate", [h, this, t, f]), f.veto) return r("ajaxSubmit: submit vetoed via form-submit-validate trigger"), this;
        var v = e.param(h, m);
        d && (v = v ? v + "&" + d : d), "GET" == t.type.toUpperCase() ? (t.url += (t.url.indexOf("?") >= 0 ? "&" : "?") + v, t.data = null) : t.data = v;
        var g = [];
        if (t.resetForm && g.push(function () {
                c.resetForm()
        }), t.clearForm && g.push(function () {
                c.clearForm(t.includeHidden)
        }), !t.dataType && t.target) {
            var x = t.success || function () { };
            g.push(function (a) {
                var r = t.replaceTarget ? "replaceWith" : "html";
                e(t.target)[r](a).each(x, arguments)
            })
        } else t.success && g.push(t.success);
        t.success = function (e, a, r) {
            for (var n = t.context || this, i = 0, o = g.length; o > i; i++) g[i].apply(n, [e, a, r || c, c])
        };
        var b = e('input[type=file]:enabled[value!=""]', this),
            y = b.length > 0,
            T = "multipart/form-data",
            j = c.attr("enctype") == T || c.attr("encoding") == T,
            w = n.fileapi && n.formdata;
        r("fileAPI :" + w);
        var S, k = (y || j) && !w;
        t.iframe !== !1 && (t.iframe || k) ? t.closeKeepAlive ? e.get(t.closeKeepAlive, function () {
            S = o(h)
        }) : S = o(h) : S = (y || j) && w ? i(h) : e.ajax(t), c.removeData("jqxhr").data("jqxhr", S);
        for (var D = 0; D < p.length; D++) p[D] = null;
        return this.trigger("form-submit-notify", [this, t]), this
    }, e.fn.ajaxForm = function (n) {
        if (n = n || {}, n.delegation = n.delegation && e.isFunction(e.fn.on), !n.delegation && 0 === this.length) {
            var i = {
                s: this.selector,
                c: this.context
            };
            return !e.isReady && i.s ? (r("DOM not ready, queuing ajaxForm"), e(function () {
                e(i.s, i.c).ajaxForm(n)
            }), this) : (r("terminating; zero elements found by selector" + (e.isReady ? "" : " (DOM not ready)")), this)
        }
        return n.delegation ? (e(document).off("submit.form-plugin", this.selector, t).off("click.form-plugin", this.selector, a).on("submit.form-plugin", this.selector, n, t).on("click.form-plugin", this.selector, n, a), this) : this.ajaxFormUnbind().bind("submit.form-plugin", n, t).bind("click.form-plugin", n, a)
    }, e.fn.ajaxFormUnbind = function () {
        return this.unbind("submit.form-plugin click.form-plugin")
    }, e.fn.formToArray = function (t, a) {
        var r = [];
        if (0 === this.length) return r;
        var i = this[0],
            o = t ? i.getElementsByTagName("*") : i.elements;
        if (!o) return r;
        var s, u, l, c, f, m, d;
        for (s = 0, m = o.length; m > s; s++)
            if (f = o[s], l = f.name)
                if (t && i.clk && "image" == f.type) f.disabled || i.clk != f || (r.push({
                    name: l,
                    value: e(f).val(),
                    type: f.type
                }), r.push({
                    name: l + ".x",
                    value: i.clk_x
                }, {
                    name: l + ".y",
                    value: i.clk_y
                }));
                else if (c = e.fieldValue(f, !0), c && c.constructor == Array)
                    for (a && a.push(f), u = 0, d = c.length; d > u; u++) r.push({
                        name: l,
                        value: c[u]
                    });
                else if (n.fileapi && "file" == f.type && !f.disabled) {
                    a && a.push(f);
                    var p = f.files;
                    if (p.length)
                        for (u = 0; u < p.length; u++) r.push({
                            name: l,
                            value: p[u],
                            type: f.type
                        });
                    else r.push({
                        name: l,
                        value: "",
                        type: f.type
                    })
                } else null !== c && "undefined" != typeof c && (a && a.push(f), r.push({
                    name: l,
                    value: c,
                    type: f.type,
                    required: f.required
                }));
        if (!t && i.clk) {
            var h = e(i.clk),
                v = h[0];
            l = v.name, l && !v.disabled && "image" == v.type && (r.push({
                name: l,
                value: h.val()
            }), r.push({
                name: l + ".x",
                value: i.clk_x
            }, {
                name: l + ".y",
                value: i.clk_y
            }))
        }
        return r
    }, e.fn.formSerialize = function (t) {
        return e.param(this.formToArray(t))
    }, e.fn.fieldSerialize = function (t) {
        var a = [];
        return this.each(function () {
            var r = this.name;
            if (r) {
                var n = e.fieldValue(this, t);
                if (n && n.constructor == Array)
                    for (var i = 0, o = n.length; o > i; i++) a.push({
                        name: r,
                        value: n[i]
                    });
                else null !== n && "undefined" != typeof n && a.push({
                    name: this.name,
                    value: n
                })
            }
        }), e.param(a)
    }, e.fn.fieldValue = function (t) {
        for (var a = [], r = 0, n = this.length; n > r; r++) {
            var i = this[r],
                o = e.fieldValue(i, t);
            null === o || "undefined" == typeof o || o.constructor == Array && !o.length || (o.constructor == Array ? e.merge(a, o) : a.push(o))
        }
        return a
    }, e.fieldValue = function (t, a) {
        var r = t.name,
            n = t.type,
            i = t.tagName.toLowerCase();
        if (void 0 === a && (a = !0), a && (!r || t.disabled || "reset" == n || "button" == n || ("checkbox" == n || "radio" == n) && !t.checked || ("submit" == n || "image" == n) && t.form && t.form.clk != t || "select" == i && -1 == t.selectedIndex)) return null;
        if ("select" == i) {
            var o = t.selectedIndex;
            if (0 > o) return null;
            for (var s = [], u = t.options, l = "select-one" == n, c = l ? o + 1 : u.length, f = l ? o : 0; c > f; f++) {
                var m = u[f];
                if (m.selected) {
                    var d = m.value;
                    if (d || (d = m.attributes && m.attributes.value && !m.attributes.value.specified ? m.text : m.value), l) return d;
                    s.push(d)
                }
            }
            return s
        }
        return e(t).val()
    }, e.fn.clearForm = function (t) {
        return this.each(function () {
            e("input,select,textarea", this).clearFields(t)
        })
    }, e.fn.clearFields = e.fn.clearInputs = function (t) {
        var a = /^(?:color|date|datetime|email|month|number|password|range|search|tel|text|time|url|week)$/i;
        return this.each(function () {
            var r = this.type,
                n = this.tagName.toLowerCase();
            a.test(r) || "textarea" == n ? this.value = "" : "checkbox" == r || "radio" == r ? this.checked = !1 : "select" == n ? this.selectedIndex = -1 : "file" == r ? /MSIE/.test(navigator.userAgent) ? e(this).replaceWith(e(this).clone()) : e(this).val("") : t && (t === !0 && /hidden/.test(r) || "string" == typeof t && e(this).is(t)) && (this.value = "")
        })
    }, e.fn.resetForm = function () {
        return this.each(function () {
            ("function" == typeof this.reset || "object" == typeof this.reset && !this.reset.nodeType) && this.reset()
        })
    }, e.fn.enable = function (e) {
        return void 0 === e && (e = !0), this.each(function () {
            this.disabled = !e
        })
    }, e.fn.selected = function (t) {
        return void 0 === t && (t = !0), this.each(function () {
            var a = this.type;
            if ("checkbox" == a || "radio" == a) this.checked = t;
            else if ("option" == this.tagName.toLowerCase()) {
                var r = e(this).parent("select");
                t && r[0] && "select-one" == r[0].type && r.find("option").selected(!1), this.selected = t
            }
        })
    }, e.fn.ajaxSubmit.debug = !1
}(jQuery);