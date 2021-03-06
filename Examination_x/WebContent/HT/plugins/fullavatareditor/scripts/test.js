swfobject.addDomLoadEvent(function () {
    //------------------------------------------------------------------------------示例一
    var webcamAvailable = false;
    var currentTab = 'upload';
	var sourcePic1Url = $.Cookie('swf1');
	var sourcePic2Url = $.Cookie('swf2');
	if(sourcePic2Url == null)
	{
		sourcePic2Url = "http://www.baidu.com/img/bdlogo.png";
	}
    var callback = function (json) {
		var id = this.id;
        switch (json.code) {
            case 2:
                //如果加载原图成功，说明进入了编辑面板，显示保存和取消按钮，隐藏拍照按钮
                if (json.type == 0) {
					if(id == "swf1")
					{
						$('#webcamPanelButton').hide();
						$('#editorPanelButtons').show();
					}
                }
                //否则会转到上传面板
                else {
                    //隐藏所有按钮
                    if(id == "swf1")$('#editorPanelButtons,#webcamPanelButton').hide();
                }
                break;
            case 3:
                //如果摄像头已准备就绪且用户已允许使用，显示拍照按钮。
                if (json.type == 0) {
                    if(id == "swf1")
					{
						$('.button_shutter').removeClass('Disabled');
						$('#webcamPanelButton').show();
						webcamAvailable = true;
					}
                }
                else {
					if(id == "swf1")
					{
						webcamAvailable = false;
						$('#webcamPanelButton').hide();
					}
                    //如果摄像头已准备就绪但用户已拒绝使用。
                    if (json.type == 1) {
                        alert('用户拒绝使用摄像头!');
                    }
                    //如果摄像头已准备就绪但摄像头被占用。
                    else {
                        alert('摄像头被占用!');
                    }
                }
                break;
            case 4:
                alert("您选择的原图片文件大小（" + json.content + "）超出了指定的值(2MB)。");
                break;
            case 5:
                //如果上传成功
                if (json.type == 0) {
					var e = this;
					var html = $('<div class="imgList"/>');
					for(var i = 0; i < json.content.avatarUrls.length; i++)
					{
						html.append('<dl><dt>头像图片'+(i+1)+'</dt><dd><img src="' + json.content.avatarUrls[i] + '" /></dd></dl>');
					}
					var button = [];
					//如果上传了原图，给个修改按钮，感受视图初始化带来的用户体验度提升
					if(json.content.sourceUrl)
					{
						button.push({text : '修改头像', callback:function(){
							this.close();
							$.Cookie(id, json.content.sourceUrl);
							location.reload();
							//e.call('loadPic', json.content.sourceUrl);
						}});
					}
					else
					{
						$.Cookie(id, null);
					}
					button.push({text : '关闭窗口'});
					$.dialog({
						title:'图片已成功保存至服务器',
						content:html,
						button:button,
						mask:true,
						draggable:false
					});
                }
                else {
                    alert(json.type);
                }
                break;
        }
    };
    var swf1 = new fullAvatarEditor('swf1', 335, {
		id : 'swf1',
        upload_url : 'upload.php',
		src_url : sourcePic1Url,			//默认加载的原图片的url
        tab_visible : false,				//不显示选项卡，外部自定义
        button_visible : false,				//不显示按钮，外部自定义
        src_upload : 2,						//是否上传原图片的选项：2-显示复选框由用户选择，0-不上传，1-上传
        checkbox_visible : false,			//不显示复选框，外部自定义
        browse_box_align : 38,				//图片选择框的水平对齐方式。left：左对齐；center：居中对齐；right：右对齐；数值：相对于舞台的x坐标
		webcam_box_align : 38,				//摄像头拍照框的水平对齐方式，如上。
		avatar_sizes : '258*200',			//定义单个头像
		avatar_sizes_desc :'258*200像素',	   //头像尺寸的提示文本。
        browse_box_align:e�����dA9֋�اqnU.ٜ鹾�>/�F�ϲ����w� ��b�g���L*�s��"��~�>D3��r�c%�+~���v�9#4��+WLË~0��(/�K�K�!�_2�'�)�oӟ��u[CP"T�!�O*B��T��DB���j"I�)�7�����:��i$�P�zՀ�d�_�,� 48���w�j�����jOj%�۰��[�Jq�J���/Wѐ��w;���I�_�ܻ�dP1�`K�������w�ML�Ъ%<c��?g�<����c,�}*��4��T���F�C��n[�5����Y�p�=����0@�!j0t}C@-��Za���C=?���W$�,�}X�e1%5>�׆�rm�x_��#C�ZW������~�
De�763f��;D�'-rå,���ݎ�
&
�F�aydz��z�5�d����4_W�sU��6��:��X���:nZȲ�]1��Ѽ&u����a#��#l��=��n�a쨊8���;�M��,������3@�!Ԗ�-��@�����LO���������ێ�)�D�B�:���j�[B��r�>�d��c=�$Rt���y�����V�]�6�U�ѯ�-��� L&C
����Uӻ!��u�v2���0�?�)L�F7��<�<�|p�+e�N=r<V��lu�@��I!�<���=�͸�N��������׿��+Pt�(�nDx|t�6�Ì�-_m
�q5�L�I��iր�Sd���K�C�L��Cϸ��L4�h�n��[UK#�[-��l���-�du�`���u�=S�,�p�0�c���̉X�����a��ǵ��8
��ZS%�+��O%o�X���Bi1���� �+*����25]!9eM��L�Q���SM�|#;��i��Zp���9�:�	z�,q�m�A�\��\T�*�'�l4!��&�]���r8d�-$,/�Ƒ��M�q8�~�Ӫe��Qզ�T�����̾�\��M� ]S�ƗmD1�p2�7f�-���iBu�8P�]2����Zɦ��?�Ġ/�}�&�O��˙�sQ���[C�g�������U���1����sch)�]��=�����f(�����:_������ܩ�c�&'��D$[bF!��ɹQC��A�|uM�\R0����0��5�u�0�PAv��I�q�n��Ԙh��+�����o�_�K֤�R3�j��G*���	��<������&��r�N�(fsyR����q�,�t}��hmV͋�jn\�X$P��	���{����}x{��(N'�,RP������NhN���(G'���9/����`N��*��0�ti��f��;Ka�fq`D�ivY� ��$���5-���,�*m��o�������$��,KٲE.��L�U�͛��x�^�R��[`2%~7�޿(�zN�%f�}���0� ��v����c��Ǽ28&Q��5�ŉX\$�Q����r���LȨ!�Q�aDԩ�ɓ���Y+��&Z�4�����L�\�1C�
�z�X�"ހ��\웾z
��F���6��^�"�J��Š�<nw��u�S����*aYڀ�8�J�S]t�(����8ܬ��L�v7_P�h��<��r���x��LW�>�FV�	#�쇋4�qY�J�/��l��&^�	�ǧ���C'�H�q�����Yxt!X綬�'4c�l�A����9��
�G1>��R�ڝ],�g;QR0L^T�N��)[��.����羨N�p��4�M嵡v��n�T�ػM�w?�v#0�b�� �Eh\��4��i��d�����EQf�ğ���]M��y�8����칳�V���0�ͩ��4�8R̯Ʋ�O��o���kI=>�tv�� ~^�����X�
V�y�����`�J��!���ܖ�W��!/p�B��!��T����N5��)Y~�k.���� �Va�c��X�O����7J�;N���E��h����]�4N>������pZs?p��t��7�Ȩ
��ל�+����Ϡ{�y8�:h���$1��¶���ND9��i���j2�5���u�黖�@^��Փ���7�8k� �^3���p����X��c����P�>q�.;M�q�)�"^_��x��&NzD� ���~�/m�f1��}�q�Cr�7�r��g[�$eX�.V���S5i޴�^��5���v0%־S'
��č���1�J�s1����8��H ����ʿ��cj��ņ��i1������2���T5f��^d�Ŷ�xm}[24c������}@;O�f���/<��0���Ot��3���Z�=��;#�<6�7���El6�֡�s��=W�2�Oo��͇6rB�nB<\m�O(�~�}��Ew�\ق���v;���8� �1�8��K_����/�"XKL��U�O���l,�_��o��j����J#W�t�A�l.�UI�H���_n����^�&Q�-��f�G����S�xB����)ô��������k>�_:�.qw[�	!Q��"���̩�x�������9l�<A)6�s�}C��?wy �T��j�A�^�3��@����@�9�jE�z�7fK7�$���5��ɡ����h
�oN����B���=!͆�5�q�nU��Nի��҆���-nr�E%�`0N�X����w�NK*ա�@x��Uo��#��L-IY��F;���U�U��|H��W��?y���V�y����.;ZTc�@��O��.	��U~����׌.��89$���\���(�ӲM�]l{	{B��x�ñȂ�ѭ�wl��ìaq���("֓�{�'=�Fz f�nr��Ґ��a�Q��&�~1�ϳ.|��3�Բ��w�T���!e�
9ț#m�Iv:�~�10�<�w~sےiF|z��L��>�҄�9�ʿ�[.Q��ؗθ�� P���exX�Z k��l���aSG'�8�6�$�?�Y�eO��j�[ϋ[;y��b'�V�/K��AN-�$���O:Jo�5�
�>(:E��M���k�AG/��)͖"a~�E{��5{������Z�%k��u�gE��Q<Z�u���xFEZi������1���ud,�1u�oY��˿�i�n\�a����)�M �YV�(I��Z֌�D�-���N�������4���_�i�sV�����p���}^�Fgh�k=�Úױ?Hz��C\*�8<�H@��k�x�~C�b@Qf�4�_�I�.�RU�^���}.�$H�4e�k�!@'~�M"���(jQ?m�(�<C>|{���J������`����>{�W3詓�*�˹V���:).���s� �-0�@�������Y&!������x���JuŊ2�O}���V��Z��kT�B�@5�[��8��jt�� ɚ�zx�}W]��>/�?�H��0-�٭ǒ�Ͼ�� &e��nA1(�ʆ������"/K���g���>�|�>���~
E��N:��X�L>΂�s5�v���*~�8�$��\��t@4<MO�;�R�I��SZ���ԄVr���p!u�ʡX�x�E�=�;\V\{��3'J�3�r���	�9�Q�~rp�T�Z��S�N���^B��ymq�F=]�Ծ;�G���	v�H֡l�����28
�Mey���۔�l/�n�waX�����q��a�W;�77(��ˣ�E�O7\�\�;!hb��7��N�V�I1�ZV+�+�0K��7��
E�|�l�83�	5��p`i��A�2���W��D���	ŀ�&ҧ�J�9g�0��缜���Q��#6z )�DUKwoR[2�#G^@�꣟B��g�?��· =�Fp K��Fٷ���)Q~/7y�NR��
ПN�����&'K�k�����Cc��{:�k}�c��o�E��(n2�@2V�f���G�)�����H���0�6&�j@�$\�;�Ǌ�*L`"h���t&���4��f%ʩ?�e�Y��W�o�$w�x&����HY�AY在{M��^��O�+��6yS��U�@C�,�.���o�T(��#�=���K�"�Q!��y�*Ch���n��Dz��T_�R���i����8�n %����,��zJ+�<�{�v��Ueb�\�h��>%�*3�5rٗhz�j���-��0���;x���A�^<gW��u��#�ty�.���m�ݥ��$�$9�*!(��E���t�+�u¢X�fG,mΉ]K�����l���c�9!�E0$L���3�������+J�o�fg�RH@�����Ɩ��I]��
�{d�
���O�h�������s)��nڒCO��"no�'܉���tL`�Ȳ����< |Oj�P2�t�+$��k�j��>M��HkDϥoCȝ�#�8}�����_k�؍HF,���2\9Fv�R㤟���B��u=�e�K�H�����4Ʈ��t��ϱ�