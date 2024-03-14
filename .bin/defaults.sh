#!/bin/zsh

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

#Sonomaで##は確認済み
#NSGlobalDomain の代わりに -g または -globalDomain と指定可
#以下のコマンドで比較可能（-currentHostも同様）
#defaults read > before.txt
#defaults read > after.txt
#diff before.txt after.txt


################################################################################
# システム設定 > Wi-Fi
################################################################################

## 詳細 > DNS > DNSサーバ
networksetup -setdnsservers Wi-Fi 2606:4700:4700::1111 2606:4700:4700::1001 1.1.1.1 1.0.0.1


################################################################################
# システム設定 > ネットワーク
################################################################################

## ファイアウォール > ファイアウォール
sudo defaults write /Library/Preferences/com.Apple.alf globalstate -int 1


################################################################################
# システム設定 > サウンド
################################################################################

## サウンドエフェクト > 起動時にサウンドを再生
sudo nvram StartupMute=%01

## サウンドエフェクト > 音量を変更するときにフィードバックを再生
defaults write -g com.apple.sound.beep.feedback -bool "true"


################################################################################
# システム設定 > 外観
################################################################################

## サイドバーのアイコンサイズ
defaults write -g NSTableViewDefaultSizeMode -int "1"

## スクロールバーを表示 > 常に表示
defaults write -g AppleShowScrollBars -string "Always"

## スクロールバーをクリックして > クリックされた部分へジャンプ
defaults write -g AppleScrollerPagingBehavior -bool "true"


################################################################################
# システム設定 > アクセシビリティ
################################################################################

## ポインタコントロール > トラックパッドオプション > ドラッグ方法: 3本指のドラッグ
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool "true"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool "true"
defaults -currentHost write -g com.apple.trackpad.threeFingerDragGesture -bool "true"


################################################################################
# システム設定 > コントロールセンター
################################################################################

## コントロールセンターモジュール > Bluetooth > メニューバーに表示
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool "true"

## コントロールセンターモジュール > サウンド > メニューバーに常に表示
defaults write com.apple.controlcenter "NSStatusItem Visible Sound" -bool "true"

## その他のモジュール > バッテリー > 割合（％）を表示
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool "true"

## メニューバーのみ > Spotlight > メニューバーに非表示
defaults -currentHost write com.apple.Spotlight MenuItemHidden -int 1

## メニューバーのみ > Siri > メニューバーに非表示
defaults write com.apple.Siri StatusMenuVisible -bool "false"


################################################################################
# システム設定 > デスクトップとDock
################################################################################

## Dock > サイズ:
defaults write com.apple.dock tilesize -int 36

## Dock > ウインドウをしまうときのエフェクト: スケールエフェクト
defaults write com.apple.dock mineffect -string "scale"

## Dock > ウインドウをアプリケーションアイコンにしまう
defaults write com.apple.dock minimize-to-application -bool "true"

## Dock > Dockを自動的に表示/非表示
defaults write com.apple.dock autohide -bool "true"

## アプリの提案と最近使用したアプリをDockに表示
defaults write com.apple.dock show-recents -bool "false"

## デスクトップとステージマネージャ > 壁紙をクリックしてデスクトップを表示 > ステージマネージャ使用時のみ
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool "false"

## Mission Control > 最新の使用状況に基づいて操作スペースを自動的に並び替える
defaults write com.apple.dock mru-spaces -bool "false"

## ホットコーナー > 左下 > デスクトップ
defaults write com.apple.dock wvous-bl-corner -int 4
defaults write com.apple.dock wvous-bl-modifier -int 0

## ホットコーナー > 右上 > ディスプレイをスリープさせる
defaults write com.apple.dock wvous-tr-corner -int 10
defaults write com.apple.dock wvous-tr-modifier -int 0

## ホットコーナー > 右下 > クイックメモ
defaults write com.apple.dock wvous-br-corner -int 14
defaults write com.apple.dock wvous-br-modifier -int 0


################################################################################
# システム設定 > ロック画面
################################################################################

## 使用していない場合はスクリーンセーバを開始 > しない
defaults -currentHost write com.apple.screensaver idleTime -int 0


################################################################################
# システム設定 > キーボード
################################################################################

## キーのリピート速度
defaults write -g KeyRepeat -int 2

## リピート入力認識までの時間
defaults write -g InitialKeyRepeat -int 15

# キーボードナビゲーション
defaults write -g AppleKeyboardUIMode -int 2

## キーボードショートカット > ファンクションキー > F1、　F2などのキーを標準のファンクションキーとして使用
defaults write -g com.apple.keyboard.fnState -bool "true"

## テキスト入力 > 入力ソース > 編集 > すべての入力ソース > 英字入力中にスペルを自動変換
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool "false"

## テキスト入力 > 入力ソース > 編集 > すべての入力ソース > 文頭を自動的に大文字にする
defaults write -g NSAutomaticCapitalizationEnabled -bool "false"

## テキスト入力 > 入力ソース > 編集 > すべての入力ソース > スペースバーを2回押してピリオドを入力
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool "false"


################################################################################
# システム設定 > マウス
################################################################################

## 軌跡の速さ
defaults write -g com.apple.mouse.scaling 1.5

## ナチュラルなスクロール
defaults write -g com.apple.swipescrolldirection -bool "false"

## スクロールの速さ
defaults write -g com.apple.scrollwheel.scaling 4

## 詳細設定 > ポインタを加速
defaults write -g com.apple.mouse.linear -bool "true"


################################################################################
# システム設定 > トラックパッド
################################################################################

## 軌跡の速さ
defaults write -g com.apple.trackpad.scaling 3

## タップでクリック
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool "true"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool "true"
defaults -currentHost write -g com.apple.mouse.tapBehavior -bool "true"


################################################################################
# Finder
################################################################################

## Finder > 設定 > 一般 > 新規Finderウインドウで次を表示:
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

## Finder > 設定 > 詳細 > すべてのファイル名拡張子を表示
defaults write -g AppleShowAllExtensions -bool "true"

## Finder > 設定 > 詳細 > 拡張子を変更する前に警告を表示
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool "false"

## Finder > 設定 > 詳細 > iCloud Driveから削除する前に警告を表示
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool "false"

## Finder > 設定 > 詳細 > 検索実行時: > 現在のフォルダ内を検索
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

## Finder > 表示 > リスト
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

## Finder > 表示 > パスバーを表示
defaults write com.apple.finder ShowPathbar -bool "true"

## Finder > 表示 > ステータスバーを表示
defaults write com.apple.finder ShowStatusBar -bool "true"


################################################################################
# スクリーンショット
################################################################################

## オプション > 保存先
if [[ ! -d "$HOME/Pictures/Screenshots" ]]; then
    mkdir -p "$HOME/Pictures/Screenshots"
fi
defaults write com.apple.screencapture "location" -string "~/Pictures/Screenshots"


################################################################################
# GUIの設定項目にないもの
################################################################################

## Dock > Dockを自動的に表示/非表示 (アニメーション時間)
defaults write com.apple.dock autohide-time-modifier -float "0.4"

## Dock > Dockを自動的に表示/非表示 (遅延)
defaults write com.apple.dock autohide-delay -float "0"

## スクリーンショット撮影時のサムネイル
defaults write com.apple.screencapture "show-thumbnail" -bool "false"

## スクリーンショット保存形式
defaults write com.apple.screencapture "type" -string "jpg"

## スクリーンショット画像の影を無効化
defaults write com.apple.screencapture "disable-shadow" -bool "true"

## Dockからすべてのアプリを消す
defaults write com.apple.dock persistent-apps -array

## 隠しファイルを表示
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"

## 未確認ファイルを開くときの警告無効化
defaults write com.apple.LaunchServices LSQuarantine -bool "false"

# フィードバックを送信しない
defaults write com.apple.appleseed.FeedbackAssistant "Autogather" -bool "false"

# ネットワークストレージ上の.DS_Storeの生成を抑制
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool "true"

# USBストレージ上の.DS_Storeの生成を抑制
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool "true"


################################################################################
# アプリを再起動
################################################################################

for app in "Dock" \
	"Finder" \
	"Safari" \
 	"Mail" \
	"SystemUIServer"; do
	killall "${app}" &> /dev/null
done

echo "Done. Note that some of these changes require a logout/restart to take effect."
