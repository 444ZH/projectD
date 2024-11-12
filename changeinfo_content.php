<h4 class="myAccountTitle">個人資料</h4>
<form id="reg" name="reg" method="get">
    <span class="registerInfo ms-1">電子郵件地址</span><br>
    <span class="remark ms-1">※電子郵件地址將作為登入帳號使用，請填寫正確資訊，以免喪失會員權益(無法變更)</span>
    <div class="input-group mb-4 mx-auto d-flex flex-column">
        <input type="email" name="email" id="email" class="form-control w-100" placeholder="電子郵件地址" v-model="member.email" readonly>
    </div>
    <span class="registerInfo ms-1">手機號碼</span><br>
    <span class="remark ms-1">※為保護您的個人資料，手機一旦綁定無法變更或連結其他電子郵件(無法變更)</span>
    <div class="input-group mb-4 mx-auto d-flex flex-column">
        <input type="text" name="mobile" id="mobile" class="form-control w-100" placeholder="手機號碼" v-model="member.mobile" readonly>
    </div>
    <span class="registerInfo ms-1">姓名</span><br>
    <div class="input-group mb-4 mx-auto d-flex flex-column">
        <input type="text" name="cname" id="cname" class="form-control w-100" placeholder="請輸入姓名" v-model="member.cname" :readonly="readonly">
    </div>
    <span class="registerInfo ms-1">生日</span><br>
    <span class="remark ms-1">※會在生日月份收到特別優惠</span>
    <div class="input-group mb-4 mx-auto d-flex flex-column">
        <input type="text" name="birthday" id="birthday" class="form-control w-100" placeholder="請選擇生日" onfocus="(this.type='date')" v-model="member.birthday" :readonly="readonly">
    </div>
    <div class="input-group mb-4 mx-auto captcha" v-show="!readonly">
        <input type="hidden" name="captcha" id="captcha" v-model="captcha">
        <a href="javascript:void(0);" title="按我更新認證" @click="getCaptcha();">
            <canvas id="can"></canvas>
        </a>
        <input type="text" name="recaptcha" id="recaptcha" class="form-control me-2 w-40" placeholder="請輸入驗證碼">
    </div>
    <div class="input-group mb-5">
        <button type="button" class="regSubmitBtn" @click="editMember" v-if="readonly">更新會員資料</button>
        <button type="button" class="regSubmitBtn" v-if="readonly" data-bs-toggle="modal" data-bs-target="#exampleModal">變更會員密碼</button>
        <button type="button" class="regSubmitBtn" @click="saveMember" v-if="!readonly">儲存</button>
        <button type="button" class="regSubmitBtn" @click="readonly=true" v-if="!readonly">離開</button>
    </div>
</form>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel"><i class="fas fa-user-lock me-2"></i>會員密碼變更</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="changePW" name="changePW">
                    <div class="mb-3">
                        <label for="PWOld" class="form-label">請輸入舊密碼</label>
                        <input type="password" class="form-control" id="PWOld" name="PWOld" placeholder="舊密碼" v-model="PWOld">
                    </div>
                    <div class="mb-3">
                        <label for="PWNew1" class="form-label">請輸入新密碼</label>
                        <input type="password" class="form-control" id="PWNew1" name="PWNew1" placeholder="新密碼" v-model="PWNew1">
                    </div>
                    <div class="mb-3">
                        <label for="PWNew2" class="form-label">請再次輸入新密碼</label>
                        <input type="password" class="form-control" id="PWNew2" name="PWNew2" placeholder="再次輸入新密碼" v-model="PWNew2">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="mClose regSubmitBtn" id="mClose" data-bs-dismiss="modal">關閉</button>
                <button type="button" class="regSubmitBtn" @click="savePW();">確定</button>
            </div>
        </div>
    </div>
</div>