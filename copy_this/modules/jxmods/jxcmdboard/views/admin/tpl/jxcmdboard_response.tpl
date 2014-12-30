    <!-- Modal Popup -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" style="max-height:90%; overflow-y:auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">
                        <b>[{$exectitle}]</b> - 
                        [{ oxmultilang ident="JXCMDBOARD_DURATION" }]: <b>[{$exectime|string_format:"%.1f"}] sec.</b>
                        [{ oxmultilang ident="JXCMDBOARD_RESPONSE" }]: <b>[{if $response == "200"}]OK[{else}]ERROR: [{$response}][{/if}]</b>
                    </h4>
                </div>
                <div class="modal-body">
                    [{*<div style="white-space:pre; overflow:scroll; height:500px;">*}]

                        [{ $output }]

                    [{*</div>*}]
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                    [{*<button type="button" class="btn btn-primary">Save changes</button>*}]
                </div>
            </div>
        </div>
    </div>
             
    [{if $output}]
    <script>
        $("#myModal").modal('show');
        
        var $modalDialog = $('.modal-dialog'),
        modalHeight = $modalDialog.height(),
        browserHeight = window.innerHeight;

        $modalDialog.css({'margin-top' : modalHeight >= browserHeight ? 0 : (browserHeight - modalHeight)/2});
    </script>
    [{/if}]
                        