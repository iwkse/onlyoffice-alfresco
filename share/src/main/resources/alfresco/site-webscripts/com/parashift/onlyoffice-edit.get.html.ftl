<!--
    Copyright (c) Ascensio System SIA 2016. All rights reserved.
    http://www.onlyoffice.com
-->
<html>
<head>
    <meta http-equiv='Content-Type' content='text/html; charset=utf-8'>

    <title>ONLYOFFICE™</title>

    <link href="${url.context}/res/components/onlyoffice/onlyoffice.css" type="text/css" rel="stylesheet">

    <!--Change the address on installed ONLYOFFICE Online Editors-->
    <script id="scriptApi" type="text/javascript" src="${onlyofficeUrl}OfficeWeb/apps/api/documents/api.js"></script>

    <script type="text/javascript" src="${url.context}/res/components/onlyoffice/onlyoffice.js"></script>
</head>

<body>
    <div>
        <div id="placeholder"></div>
    </div>
    <script>

    var docName = "${docTitle}";
    var docType = docName.substring(docName.lastIndexOf(".") + 1).trim().toLowerCase();

    var docConfig = {
        type: "desktop",
        width: "100%",
        height: "100%",
        documentType: getDocumentType(docType),
        document: {
            title: docName,
            url: "${docUrl}",
            fileType: docType,
            key: "${key}",
            permissions: {
                edit: true
            }
        },
        editorConfig: {
            mode: "edit",
            callbackUrl: "${callbackUrl}",
            user: {
              id: "${userId}",
              firstname: "${firstName}",
              lastname: "${lastName}",
            }
        }
    };

    <#if lang??>

    docConfig.lang = "${lang}";

    </#if>

    new DocsAPI.DocEditor("placeholder", docConfig);

    //Keep Alfresco active
    setInterval(function() {
        var keepAlive = new XMLHttpRequest();

        keepAlive.open("GET", "${url.context}/proxy/alfresco/api/admin/restrictions", true);

        keepAlive.send();

    }, 60000);
    </script>
</body>
</html>
