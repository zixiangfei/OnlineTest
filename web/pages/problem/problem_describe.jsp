<%--
  Created by IntelliJ IDEA.
  User: zhengluzhou
  Date: 2022/5/7
  Time: 10:43 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<body aria-hidden="false">
<link href="/OnlineTest/static/css/contest-problem.css" rel="stylesheet" type="text/css">

<div class="container" id="description-container">
    <style type="text/css" >
        .input, .output {
        border: 1px solid #888888;
    }

    .output {
        margin-bottom: 1em;
        position: relative;
        top: -1px;
    }

    .output pre, .input pre {
        background-color: #EFEFEF;
        line-height: 1.25em;
        margin: 0;
        padding: 0.25em;
    }

    .title {
        background-color: #FFFFFF;
        border-bottom: 1px solid #888888;
        font-family: arial;
        font-weight: bold;
        padding: 0.25em;
    }

    @media print {
        div.print-content article.node .node-blog .clearfix div.item-body p a {
            display: none
        }

        .compact-problemset div.ttypography {
            margin: 0 !important
        }

        .compact-problemset .problem-statement p {
            margin-bottom: .75em !important;
            page-break-inside: avoid
        }

        .compact-problemset .problem-frames {
            column-count: 2
        }

        .compact-problemset .problem-statement .input, .compact-problemset .problem-statement .output {
            page-break-inside: avoid
        }

        .compact-problemset .problem-statement .output {
            page-break-inside: avoid
        }

        .compact-problemset .problem-statement {
            margin: .25em;
            font-family: helvetica neue, Helvetica, Arial, sans-serif;
            line-height: 1.45em;
            font-size: 1.4rem
        }

        .compact-problemset #header {
            display: none
        }

        .compact-problemset .problem-statement .time-limit, .compact-problemset .problem-statement .memory-limit {
            display: inline
        }

        .compact-problemset .problem-statement .time-limit::after {
            content: ", "
        }

        .compact-problemset .problem-statement .property-title {
            display: none
        }

        .compact-problemset .problem-statement .input-file, .compact-problemset .problem-statement .output-file {
            display: none
        }

        .compact-problemset .problem-statement .sample-tests .section-title, .compact-problemset .problem-statement .note .section-title {
            display: none
        }

        .compact-problemset .input-output-copier {
            display: none
        }
    }

    .problem-statement {
        margin: .5em;
        font-family: helvetica neue, Helvetica, Arial, sans-serif;
        line-height: 1.5em;
        font-size: 1.4rem
    }

    .problem-statement .epigraph {
    }

    .problem-statement .epigraph-text {
        margin-left: 67%;
        width: 33%
    }

    .problem-statement .epigraph-source {
        border-top: 1px solid #888;
        text-align: right
    }

    .problem-statement .lstlisting {
        padding: .5em
    }

    .problem-statement .tex-tabular {
        margin: 1em 0;
        border-collapse: collapse;
        border-spacing: 0;
        border: initial !important
    }

    .problem-statement .tex-tabular * {
        border: initial !important
    }

    .problem-statement .tex-tabular tr:hover * {
        background: initial
    }

    .problem-statement .tex-tabular .tex-tabular-border-left {
        border-left: 1px #ccc solid !important
    }

    .problem-statement .tex-tabular .tex-tabular-border-right {
        border-right: 1px #ccc solid !important
    }

    .problem-statement .tex-tabular .tex-tabular-border-top {
        border-top: 1px #ccc solid !important
    }

    .problem-statement .tex-tabular .tex-tabular-border-bottom {
        border-bottom: 1px #ccc solid !important
    }

    .problem-statement .tex-tabular .tex-tabular-text-align-left {
        text-align: left
    }

    .problem-statement .tex-tabular .tex-tabular-text-align-center {
        text-align: center
    }

    .problem-statement .tex-tabular .tex-tabular-text-align-right {
        text-align: right
    }

    .problem-statement .tex-tabular td {
        padding: .4em;
        vertical-align: middle
    }

    .problem-statement p {
        margin: 0 0 1em !important
    }

    .problem-statement .header {
        margin-bottom: 1em;
        text-align: center
    }

    .problem-statement .header .title {
        font-size: 150%;
        margin-bottom: .5em
    }

    .problem-statement .header .title {
        font-size: 150%;
        font-family: helvetica neue, Helvetica, Arial, sans-serif
    }

    .problem-statement ul {
        list-style: disc;
        list-style-type: disc;
        list-style-position: outside;
        margin-top: 1em !important;
        margin-bottom: 1em !important
    }

    .problem-statement ol {
        list-style: decimal;
        list-style-type: decimal;
        list-style-position: outside;
        margin-top: 1em !important;
        margin-bottom: 1em !important
    }

    .problem-statement li {
        line-height: 1.5em;
        margin-left: 3em
    }

    .problem-statement .property-title {
        display: inline;
        padding-right: 4px
    }

    .problem-statement .property-title:after {
        content: ":"
    }

    .problem-statement .time-limit, .problem-statement .memory-limit, .problem-statement .input-file, .problem-statement .output-file {
        margin: 0 auto
    }

    .problem-statement .legend {
        margin-bottom: 1em
    }

    .problem-statement .section-title {
        font-family: helvetica neue, Helvetica, Arial, sans-serif;
        font-size: 115%;
        font-weight: 700
    }

    .problem-statement .input-specification, .problem-statement .output-specification, .problem-statement .sample-tests, .problem-statement .author, .problem-statement .resource, .problem-statement .date {
    }

    .problem-statement .output-specification {
        margin-bottom: 1em
    }

    .problem-statement .sample-tests .sample-test {
    }

    .problem-statement .sample-tests .input, .problem-statement .sample-tests .output {
        border: 1px solid #888
    }

    .problem-statement .sample-tests .output {
        margin-bottom: 1em;
        position: relative;
        top: -1px
    }

    .problem-statement .sample-tests pre {
        line-height: 1.25em;
        padding: .25em;
        margin: 0;
        background-color: #efefef
    }

    .problem-statement .sample-tests {
        font-family: Consolas, lucida console, andale mono, bitstream vera sans mono, courier new, Courier;
        font-size: .9em
    }

    .problem-statement .sample-tests .title {
        font-size: 1.3em;
        padding: .25em;
        border-bottom: 1px solid #888;
        text-transform: lowercase;
        font-weight: 700
    }

    .problem-statement .test {
        margin-bottom: 3em
    }

    .problem-statement .test-title {
        font-weight: 700
    }

    .problem-statement .test-stem, .problem-statement .test-explanation-note {
        margin: .5em 0
    }

    .problem-statement input[type=submit] {
        margin-top: .5em;
        margin-right: 1em;
        padding: 0 1em
    }

    .problemindexholder {
        position: relative
    }

    div .problem-statement-overlay {
        position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        width: 100%;
        background-color: #000;
        z-index: 50;
        opacity: .2
    }

    .load-answers-waiting-indicator {
        position: absolute;
        top: 49%;
        left: 49%
    }

    .problem-statement input[type=radio] {
        margin-right: .5em
    }

    .problem-statement input[type=checkbox] {
        margin-right: .5em
    }

    .problem-statement input[type=text] {
        width: 20em
    }

    .problem-statement textarea {
        width: 20em;
        height: 7em
    }

    .problem-statement .test-form {
        line-height: 1.75em
    }

    .problem-statement .test-form {
        line-height: 1.75em
    }

    .tex-formula {
        font-family: times new roman, sans-serif;
        vertical-align: middle;
        margin: 0;
        border: medium;
        position: relative;
        bottom: 2px
    }

    .tex-span {
        font-size: 125%;
        font-family: times new roman, sans-serif;
        white-space: nowrap
    }

    .tex-font-size-tiny {
        font-size: 70%
    }

    .tex-font-size-script {
        font-size: 75%
    }

    .tex-font-size-footnotes {
        font-size: 85%
    }

    .tex-font-size-small {
        font-size: 85%
    }

    .tex-font-size-normal {
        font-size: 100%
    }

    .tex-font-size-large-1 {
        font-size: 115%
    }

    .tex-font-size-large-2 {
        font-size: 130%
    }

    .tex-font-size-large-3 {
        font-size: 145%
    }

    .tex-font-size-huge-1 {
        font-size: 175%
    }

    .tex-font-size-huge-2 {
        font-size: 200%
    }

    .tex-font-style-rm {
    }

    .tex-font-style-sf {
        font-family: helvetica neue, Helvetica, Arial, sans-serif
    }

    .tex-font-style-tt {
        font-size: 110%;
        font-family: courier new, monospace
    }

    .tex-font-style-md {
    }

    .tex-font-style-bf {
        font-weight: 700
    }

    .tex-font-style-up {
    }

    .tex-font-style-it {
        font-style: italic
    }

    .tex-font-style-sl {
        font-style: italic
    }

    .tex-font-style-sc {
        text-transform: uppercase
    }

    .tex-font-style-striked {
        text-decoration: line-through
    }

    .tex-font-style-underline {
        text-decoration: underline
    }

    .tex-graphics {
        display: block
    }

    .tex-font-style-part {
        font-size: 187.5%;
        font-weight: 700;
        font-family: Tahoma, Arial, Helvetica, sans-serif
    }

    .tex-font-style-chapter {
        font-size: 162.5%;
        font-weight: 700;
        font-family: Tahoma, Arial, Helvetica, sans-serif
    }

    .tex-font-style-section {
        font-size: 137.5%;
        font-weight: 700
    }

    .tex-font-style-subsection {
        font-size: 125%;
        font-weight: 700
    }

    .tex-font-style-subsubsection {
        font-size: 112.5%;
        font-weight: 700
    }

    .tex-font-style-paragraph {
        font-size: 100%;
        font-weight: 700
    }

    .tex-font-style-subparagraph {
        font-size: 100%;
        font-style: italic
    }

    .problem-statement .tex-tabular .tex-graphics {
        max-width: 100%
    }

    .problem-statement .tex-tabular td > p {
        margin-bottom: 0 !important
    }
    </style>


    <dt></dt>
    <dd>${requestScope.problem.describe}</dd>
    <c:if test="${requestScope.problem.type.equals('判断')}">
        <dt>A</dt>
        <dd>正确</dd>
        <dt>B</dt>
        <dd>错误</dd>
    </c:if>
    <c:if test="${not requestScope.problem.type.equals('判断')}">
        <dd>A</dd>
        <dt>${requestScope.option[0]}</dt>
        <dd>B</dd>
        <dt>${requestScope.option[1]}</dt>
        <dd>C</dd>
        <dt>${requestScope.option[2]}</dt>
        <dd>D</dd>
        <dt>${requestScope.option[3]}</dt>
    </c:if>

</body>