//: Playground - noun: a place where people can play

import UIKit


enum DownloadStatus {
    case Downloading
    case Interrpted
    case Succeeded
    case Error
}

var status = DownloadStatus.Downloading

switch status {
case DownloadStatus.Downloading:
    print("True")
default:
    <#code#>
}
