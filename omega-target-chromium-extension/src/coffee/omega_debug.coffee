
logStore = idbKeyval.createStore('log-store', 'log-store')

waitTimeFn = (timeout = 1000) ->
  return new Promise((resolve, reject) ->
    setTimeout( ->
      resolve()
    , timeout)
  )

window.OmegaDebug =
  getProjectVersion: ->
    chrome.runtime.getManifest().version
  getExtensionVersion: ->
    chrome.runtime.getManifest().version
  downloadLog: ->
    idbKeyval.entries(logStore).then((entries) ->
      zip = new JSZip()
      zipFolder = zip.folder('AirSwitch')
      entries.forEach((entry) ->
        if entry[0] != 'lastError'
          zipFolder.file(entry[1].date + '.log', entry[1].val)
      )
      return zip.generateAsync({
        compression: "DEFLATE",
        compressionOptions: {
          level: 9
        },
        type: 'blob'
      })
    ).then((blob) ->
      filename = "AirSwitchLog_#{Date.now()}.zip"
      saveAs(blob, filename)
    )
  resetOptions: ->
    chrome.runtime.sendMessage({
      method: 'resetAllOptions'
    }, (response) ->
      # firefox still use localStorage
      localStorage.clear()
      # as storage watch value changed
      # and background localStorage state delay saved
      # this must after storage and wait 2 seconds
      Promise.all([
        idbKeyval.clear(logStore),
        waitTimeFn(2000)
      ]).then( ->
        idbKeyval.clear()
      ).then( ->
        chrome.runtime.reload()
      )
    )
