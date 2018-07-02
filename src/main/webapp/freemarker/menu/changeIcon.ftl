<#include "../include.ftl">
<style>
	.lay-body{
		margin-top: 52px;
		overflow-y: auto;
		overflow-x: unset;
	}
	.lay-header{
		position: absolute;
		top: 0px;
		width: 100%;
	}
</style>
<div class="modal-dialog" style="width:100%">
    <div class="modal-content">
        <div class="modal-header lay-header">
            <button type="button" class="close" data-dismiss="modal" onclick="{parent.layer.closeAll();}"><i class="pci-cross pci-circle"></i></button>
            <h4 class="modal-title">选择您要替换的图标</h4>
        </div>

        <div class="modal-body lay-body">
            	<div class="clearfix demo-icon-list">
					            <h4 class="pad-top">站点图标</h4>
					            <hr>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon" style="height: 42px;line-height: 42px;padding-left: 42px;">无</div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-wand"></i><span>ti-wand</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-save"></i><span>ti-save</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-save-alt"></i><span>ti-save-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-direction"></i><span>ti-direction</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-direction-alt"></i><span>ti-direction-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-user"></i><span>ti-user</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-link"></i><span>ti-link</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-unlink"></i><span>ti-unlink</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-trash"></i><span>ti-trash</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-target"></i><span>ti-target</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-tag"></i><span>ti-tag</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-desktop"></i><span>ti-desktop</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-tablet"></i><span>ti-tablet</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-mobile"></i><span>ti-mobile</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-email"></i><span>ti-email</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-star"></i><span>ti-star</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-spray"></i><span>ti-spray</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-signal"></i><span>ti-signal</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-shopping-cart"></i><span>ti-shopping-cart</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-shopping-cart-full"></i><span>ti-shopping-cart-full</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-settings"></i><span>ti-settings</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-search"></i><span>ti-search</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-zoom-in"></i><span>ti-zoom-in</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-zoom-out"></i><span>ti-zoom-out</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-cut"></i><span>ti-cut</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-ruler"></i><span>ti-ruler</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-ruler-alt-2"></i><span>ti-ruler-alt-2</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-ruler-pencil"></i><span>ti-ruler-pencil</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-ruler-alt"></i><span>ti-ruler-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-bookmark"></i><span>ti-bookmark</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-bookmark-alt"></i><span>ti-bookmark-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-reload"></i><span>ti-reload</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-plus"></i><span>ti-plus</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-minus"></i><span>ti-minus</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-close"></i><span>ti-close</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-pin"></i><span>ti-pin</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-pencil"></i><span>ti-pencil</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-pencil-alt"></i><span>ti-pencil-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-paint-roller"></i><span>ti-paint-roller</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-paint-bucket"></i><span>ti-paint-bucket</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-na"></i><span>ti-na</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-medall"></i><span>ti-medall</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-medall-alt"></i><span>ti-medall-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-marker"></i><span>ti-marker</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-marker-alt"></i><span>ti-marker-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-lock"></i><span>ti-lock</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-unlock"></i><span>ti-unlock</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-location-arrow"></i><span>ti-location-arrow</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-layout"></i><span>ti-layout</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-layers"></i><span>ti-layers</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-layers-alt"></i><span>ti-layers-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-key"></i><span>ti-key</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-image"></i><span>ti-image</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-heart"></i><span>ti-heart</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-heart-broken"></i><span>ti-heart-broken</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-hand-stop"></i><span>ti-hand-stop</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-hand-open"></i><span>ti-hand-open</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-hand-drag"></i><span>ti-hand-drag</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-flag"></i><span>ti-flag</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-flag-alt"></i><span>ti-flag-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-flag-alt-2"></i><span>ti-flag-alt-2</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-eye"></i><span>ti-eye</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-import"></i><span>ti-import</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-export"></i><span>ti-export</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-cup"></i><span>ti-cup</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-crown"></i><span>ti-crown</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-comments"></i><span>ti-comments</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-comment"></i><span>ti-comment</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-comment-alt"></i><span>ti-comment-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-thought"></i><span>ti-thought</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-clip"></i><span>ti-clip</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-check"></i><span>ti-check</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-check-box"></i><span>ti-check-box</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-camera"></i><span>ti-camera</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-announcement"></i><span>ti-announcement</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-brush"></i><span>ti-brush</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-brush-alt"></i><span>ti-brush-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-palette"></i><span>ti-palette</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-briefcase"></i><span>ti-briefcase</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-bolt"></i><span>ti-bolt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-bolt-alt"></i><span>ti-bolt-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-blackboard"></i><span>ti-blackboard</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-bag"></i><span>ti-bag</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-world"></i><span>ti-world</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-wheelchair"></i><span>ti-wheelchair</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-car"></i><span>ti-car</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-truck"></i><span>ti-truck</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-timer"></i><span>ti-timer</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-ticket"></i><span>ti-ticket</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-thumb-up"></i><span>ti-thumb-up</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-thumb-down"></i><span>ti-thumb-down</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-stats-up"></i><span>ti-stats-up</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-stats-down"></i><span>ti-stats-down</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-shine"></i><span>ti-shine</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-shift-right"></i><span>ti-shift-right</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-shift-left"></i><span>ti-shift-left</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-shift-right-alt"></i><span>ti-shift-right-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-shift-left-alt"></i><span>ti-shift-left-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-shield"></i><span>ti-shield</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-notepad"></i><span>ti-notepad</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-server"></i><span>ti-server</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-pulse"></i><span>ti-pulse</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-printer"></i><span>ti-printer</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-power-off"></i><span>ti-power-off</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-plug"></i><span>ti-plug</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-pie-chart"></i><span>ti-pie-chart</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-panel"></i><span>ti-panel</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-package"></i><span>ti-package</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-music"></i><span>ti-music</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-music-alt"></i><span>ti-music-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-mouse"></i><span>ti-mouse</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-mouse-alt"></i><span>ti-mouse-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-money"></i><span>ti-money</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-microphone"></i><span>ti-microphone</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-menu"></i><span>ti-menu</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-menu-alt"></i><span>ti-menu-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-map"></i><span>ti-map</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-map-alt"></i><span>ti-map-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-location-pin"></i><span>ti-location-pin</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-light-bulb"></i><span>ti-light-bulb</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-info"></i><span>ti-info</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-infinite"></i><span>ti-infinite</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-id-badge"></i><span>ti-id-badge</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-hummer"></i><span>ti-hummer</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-home"></i><span>ti-home</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-help"></i><span>ti-help</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-headphone"></i><span>ti-headphone</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-harddrives"></i><span>ti-harddrives</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-harddrive"></i><span>ti-harddrive</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-gift"></i><span>ti-gift</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-game"></i><span>ti-game</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-filter"></i><span>ti-filter</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-files"></i><span>ti-files</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-file"></i><span>ti-file</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-zip"></i><span>ti-zip</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-folder"></i><span>ti-folder</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-envelope"></i><span>ti-envelope</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-dashboard"></i><span>ti-dashboard</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-cloud"></i><span>ti-cloud</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-cloud-up"></i><span>ti-cloud-up</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-cloud-down"></i><span>ti-cloud-down</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-clipboard"></i><span>ti-clipboard</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-calendar"></i><span>ti-calendar</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-book"></i><span>ti-book</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-bell"></i><span>ti-bell</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-basketball"></i><span>ti-basketball</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-bar-chart"></i><span>ti-bar-chart</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-bar-chart-alt"></i><span>ti-bar-chart-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-archive"></i><span>ti-archive</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-anchor"></i><span>ti-anchor</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-alert"></i><span>ti-alert</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-alarm-clock"></i><span>ti-alarm-clock</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-agenda"></i><span>ti-agenda</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-write"></i><span>ti-write</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-wallet"></i><span>ti-wallet</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-video-clapper"></i><span>ti-video-clapper</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-video-camera"></i><span>ti-video-camera</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-vector"></i><span>ti-vector</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-support"></i><span>ti-support</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-stamp"></i><span>ti-stamp</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-slice"></i><span>ti-slice</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-shortcode"></i><span>ti-shortcode</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-receipt"></i><span>ti-receipt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-pin2"></i><span>ti-pin2</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-pin-alt"></i><span>ti-pin-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-pencil-alt2"></i><span>ti-pencil-alt2</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-eraser"></i><span>ti-eraser</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-more"></i><span>ti-more</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-more-alt"></i><span>ti-more-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-microphone-alt"></i><span>ti-microphone-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-magnet"></i><span>ti-magnet</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-line-double"></i><span>ti-line-double</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-line-dotted"></i><span>ti-line-dotted</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-line-dashed"></i><span>ti-line-dashed</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-ink-pen"></i><span>ti-ink-pen</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-info-alt"></i><span>ti-info-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-help-alt"></i><span>ti-help-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-headphone-alt"></i><span>ti-headphone-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-gallery"></i><span>ti-gallery</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-face-smile"></i><span>ti-face-smile</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-face-sad"></i><span>ti-face-sad</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-credit-card"></i><span>ti-credit-card</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-comments-smiley"></i><span>ti-comments-smiley</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-time"></i><span>ti-time</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-share"></i><span>ti-share</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-share-alt"></i><span>ti-share-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-rocket"></i><span>ti-rocket</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-new-window"></i><span>ti-new-window</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-rss"></i><span>ti-rss</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-rss-alt"></i><span>ti-rss-alt</span></div>
					            </div>
					        </div>
					        <div class="clearfix demo-icon-list">
					            <h4 class="pad-top">标头图标</h4>
					            <hr>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-flickr"></i><span>ti-flickr</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-flickr-alt"></i><span>ti-flickr-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-instagram"></i><span>ti-instagram</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-google"></i><span>ti-google</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-github"></i><span>ti-github</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-facebook"></i><span>ti-facebook</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-dropbox"></i><span>ti-dropbox</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-dropbox-alt"></i><span>ti-dropbox-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-dribbble"></i><span>ti-dribbble</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-apple"></i><span>ti-apple</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-android"></i><span>ti-android</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-yahoo"></i><span>ti-yahoo</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-trello"></i><span>ti-trello</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-stack-overflow"></i><span>ti-stack-overflow</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-soundcloud"></i><span>ti-soundcloud</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-sharethis"></i><span>ti-sharethis</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-sharethis-alt"></i><span>ti-sharethis-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-reddit"></i><span>ti-reddit</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-microsoft"></i><span>ti-microsoft</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-microsoft-alt"></i><span>ti-microsoft-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-linux"></i><span>ti-linux</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-jsfiddle"></i><span>ti-jsfiddle</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-joomla"></i><span>ti-joomla</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-html5"></i><span>ti-html5</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-css3"></i><span>ti-css3</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-drupal"></i><span>ti-drupal</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-wordpress"></i><span>ti-wordpress</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-tumblr"></i><span>ti-tumblr</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-tumblr-alt"></i><span>ti-tumblr-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-skype"></i><span>ti-skype</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-youtube"></i><span>ti-youtube</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-vimeo"></i><span>ti-vimeo</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-vimeo-alt"></i><span>ti-vimeo-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-twitter"></i><span>ti-twitter</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-twitter-alt"></i><span>ti-twitter-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-linkedin"></i><span>ti-linkedin</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-pinterest"></i><span>ti-pinterest</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-pinterest-alt"></i><span>ti-pinterest-alt</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-themify-logo"></i><span>ti-themify-logo</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-themify-favicon"></i><span>ti-themify-favicon</span></div>
					            </div>
					            <div class="col-sm-6 col-md-3">
					                <div class="demo-icon"><i class="ti-themify-favicon-alt"></i><span>ti-themify-favicon-alt</span></div>
					            </div>
					        </div>
        </div>
    </div>
</div>
	<div id="page-content">
			
	</div>
	<script>
		var mid = "${mid}";
		$(document).ready(function() {
			$('.demo-icon').on('click',function(e){
		        var icon = $(this).find('span').text();
		        var data = common_ajax.ajaxFunc("/admin/menu/changeIcon.shtml", {"icon":icon,"mid":mid}, "json", null);
		        if(data.success){
					parent.pointLion.alertMsg("保存成功!" , "success" , "small" , null);
					parent.doPjax(ctx+'/admin/menu/getListPage.shtml');//跳转到列表页
					parent.layer.closeAll();
				}
		    });
			
			var clientH = document.body.clientHeight-54;
			$(".lay-body").css("height",clientH+"px");
		});
	</script>